package com.unam.poo.controllers.Publication;

import com.unam.poo.controllers.ManageController;
import com.unam.poo.models.*;
import com.unam.poo.services.*;
import com.unam.poo.services.CharacteristicAmenity.CharacteristicAmenityService;
import com.unam.poo.services.City.CityService;
import com.unam.poo.services.Amenity.AmenityService;
import com.unam.poo.services.Province.ProvinceService;
import com.unam.poo.services.Publication.PublicationService;
import com.unam.poo.services.Type.TypeService;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@RequestMapping("/publication")
@Controller
public class PublicationController {

    @Autowired
    PublicationService publicationService;

    @Autowired
    TypeService typeService;

    @Autowired
    UsersService usersService;

    @Autowired
    ProvinceService provinceService;

    @Autowired
    AmenityService amenityService;

    @Autowired
    CharacteristicAmenityService characteristicAmenityService;

    @Autowired
    CityService cityService;


    private static final Logger logger = LoggerFactory.getLogger(ManageController.class);

    @GetMapping("/creation")
    public String publicationLoad(Model model){

        List<Type> types = typeService.findAll();
        List<Province> provinces = provinceService.findAll();
        List<City> cities = cityService.findAll();
        List<Amenity> amenities = amenityService.findAll();
        List<CharacteristicAmenity> characteristicAmenities = characteristicAmenityService.findAll();


        model.addAttribute("cities", cities);
        model.addAttribute("provinces", provinces);
        model.addAttribute("types", types);
        model.addAttribute("amenities", amenities);
        model.addAttribute("characteristicAmenities", characteristicAmenities);
        model.addAttribute("publication", new Publication());
        return "Publication/createPublication";
    }

    @PostMapping("/new")
    public String createPublication(@Validated @ModelAttribute ("publication") Publication publication, BindingResult result, Model model, @RequestParam("file[]") List<MultipartFile> imagen) {
    if (result.hasErrors()) {
        List<Type> types = typeService.findAll();
        List<Province> provinces = provinceService.findAll();
        List<City> cities = cityService.findAll();
        List<Amenity> amenities = amenityService.findAll();
        List<CharacteristicAmenity> characteristicAmenities = characteristicAmenityService.findAll();


        model.addAttribute("types", types);
        model.addAttribute("amenities", amenities);
        model.addAttribute("characteristicAmenities", characteristicAmenities);

        return "Publication/createPublication";
    }
//        @RequestParam("file[]")List<MultipartFile> image
    if (!imagen.isEmpty()) {
        try {
            Path directorImages = Path.of("src//main//webapp//assets//img//rents");
            String absolutePath = directorImages.toFile().getAbsolutePath();

            List<PhotoPublication> photos = new ArrayList<>();

            for (MultipartFile file : imagen) {
                System.out.println(file.getOriginalFilename());

                byte[] bytes = file.getBytes();



                String nameImage = Math.random() + file.getOriginalFilename();
                Path completePath = Paths.get(absolutePath + "//" + nameImage);
                Files.write(completePath, bytes);

                PhotoPublication photoPublication = new PhotoPublication();
                photoPublication.setUrl(nameImage);
                photoPublication.setPublicationId(publication);

                photos.add(photoPublication);
            }
            publication.setImages(photos);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    publicationService.savePublication(publication);
    return "redirect:/publication/consultation";
    }

    @GetMapping("/edition/{id}")
    public String editPublication(@PathVariable("id") Long id, Model model) {
        System.out.println("confirm");
        Publication publication = publicationService.getPublicationById(id);
        List<Type> types = typeService.findAll();
        List<Province> provinces = provinceService.findAll();
        List<City> cities = cityService.findAll();
        List<Amenity> amenities = amenityService.findAll();
        List<CharacteristicAmenity> characteristicAmenities = characteristicAmenityService.findAll();

        model.addAttribute("cities", cities);
        model.addAttribute("provinces", provinces);
        model.addAttribute("types", types);
        model.addAttribute("amenities", amenities);
        model.addAttribute("characteristicAmenities", characteristicAmenities);

        model.addAttribute("publication", publication);


        return "Publication/editPublication";
    }

    @PostMapping("/edition/{id}")
    public String editPublication(@PathVariable("id") Long id, @Validated @ModelAttribute("publication") Publication publication, BindingResult result, @RequestParam(value = "image", required = false) List<MultipartFile> images) {
        System.out.println("Received publication: " + publication);

        if (result.hasErrors()) {
            return "Publication/editPublication";
        }

        Publication existingPublication = publicationService.getPublicationById(id);

        if (existingPublication == null) {
            return "redirect:/publication/consultation";
        }

        if (images != null && !images.isEmpty()) {
            try {
                Path directorImages = Path.of("src//main//webapp//assets//img//rents");
                String absolutePath = directorImages.toFile().getAbsolutePath();

                Set<PhotoPublication> existingPhotos = new HashSet<>(existingPublication.getImages());
                List<PhotoPublication> newPhotos = new ArrayList<>();

                for (MultipartFile file : images) {
                    System.out.println(file.getOriginalFilename());

                    byte[] bytes = file.getBytes();
                    String nameImage = UUID.randomUUID() + "_" + file.getOriginalFilename();
                    Path completePath = Paths.get(absolutePath + "//" + nameImage);
                    Files.write(completePath, bytes);

                    PhotoPublication photoPublication = new PhotoPublication();
                    photoPublication.setUrl(nameImage);
                    photoPublication.setPublicationId(publication);

                    newPhotos.add(photoPublication);
                }
                existingPhotos.removeAll(newPhotos);
                for (PhotoPublication photoToRemove : existingPhotos) {
                    Files.deleteIfExists(Paths.get(absolutePath + "//" + photoToRemove.getUrl()));
                }
                publication.setImages(newPhotos);

            } catch (IOException e) {
                e.printStackTrace();

                return "Publication/editPublication";
            }
        } else {
            publication.setImages(existingPublication.getImages());
        }
        publicationService.updatePublication(publication, id);
        return "redirect:/publication/consultation";
    }


    @GetMapping("/consultation")
    public String consultPublication(Model model){

        List<Publication> publications = publicationService.findAllByState("active");
        publications.addAll(publicationService.findAllByState("Rented"));
        List<CharacteristicAmenity> characteristicAmenities = characteristicAmenityService.findAll();

        model.addAttribute("publications", publications);
        model.addAttribute("characteristicAmenities", characteristicAmenities);

        return "Publication/consultPublication";
    }

    @GetMapping("/consultRent")
    public String consultRent(Model model){

        List<Publication> publications = publicationService.findAllByState("Rented");

        model.addAttribute("publications", publications);

        return "Publication/consultRents";
    }



    @GetMapping("/chosen-publication/{id}")
    public String readPublication(@PathVariable("id") Long id, Model model, HttpServletRequest request){

        Publication publication = publicationService.getPublicationById(id);
        Long userId = (Long) request.getSession().getAttribute("userId");
        Users user = usersService.getUserById(userId);

        model.addAttribute("user", user);
        model.addAttribute("publication", publication);
        return "Publication/readPublication";
    }


    @PostMapping("/publication-removal-pub/{id}")
    public String deletePublicationInPublication(@PathVariable("id") Long id) {

        publicationService.deletePublicationById(id);
        return "redirect:/publication/consultation";
    }

    @PostMapping("/publication-removal-self/{id}")
    public String deletePublicationInProfile(@PathVariable("id") Long id) {

        publicationService.deletePublicationById(id);
        return "redirect:/user/profile";
    }

    @GetMapping("/chosen-publications")
    public String readPublications(Model model){

        List<Publication> publications = publicationService.findAllByState("active");

        model.addAttribute("publications", publications);

        return "Publication/readPublications2";
    }

    @PostMapping("/addFavorite/{id}")
    public String addFavorite(@PathVariable("id") Long id, HttpServletRequest request) {
        Long userId = (Long) request.getSession().getAttribute("userId");
        usersService.addFavorites(id,userId);
        return "redirect:/publication/chosen-publication/{id}";
    }

    @PostMapping("/favorite-removal-pub/{id}")
    public String removeFavoriteInPublication(@PathVariable("id") Long id, HttpServletRequest request) {
        logger.info("Remove favorite: " + id);
        Long userId = (Long) request.getSession().getAttribute("userId");
        usersService.removeFavorites(id,userId);
        return "redirect:/publication/chosen-publication/{id}";
    }

    @PostMapping("/favorite-removal-self/{id}")
    public String removeFavoriteInProfile(@PathVariable("id") Long id, HttpServletRequest request) {
        logger.info("Remove favorite: " + id);
        Long userId = (Long) request.getSession().getAttribute("userId");
        usersService.removeFavorites(id,userId);
        return "redirect:/user/profile";
    }





}


