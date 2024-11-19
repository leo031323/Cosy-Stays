package com.unam.poo.security.util;

import com.unam.poo.models.City;
import com.unam.poo.models.Country;
import com.unam.poo.models.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.unam.poo.security.enums.RoleName;
import com.unam.poo.security.model.Role;
import com.unam.poo.security.service.RoleService;
import com.unam.poo.services.CharacteristicAmenity.CharacteristicAmenityService;
import com.unam.poo.services.City.CityService;
import com.unam.poo.services.Amenity.AmenityService;
import com.unam.poo.services.Country.CountryService;
import com.unam.poo.services.Province.ProvinceService;
import com.unam.poo.services.Type.TypeService;

@Component  
public class StarterCommand implements CommandLineRunner {

    @Autowired
    RoleService roleService;
    
    @Autowired
    CountryService countryService;

    @Autowired
    ProvinceService provinceService;

    @Autowired
    CityService cityService;

    @Autowired
    TypeService typeService;

    @Autowired
    AmenityService amenityService;

    @Autowired
    CharacteristicAmenityService characteristicAmenityService;

    @Override
    public void run(String... args) throws Exception {

        if (!(roleService.getByRoleName(RoleName.ROLE_USER).isPresent())) {
            Role roleAdmin = new Role(RoleName.ROLE_USER);
            roleService.save(roleAdmin);
            System.out.println("ROLE_USER CREAT");
        }else{
            System.out.println("ROLE_USER EXISTING");
        } 

        Boolean valor = false;
        for (Country country : countryService.findAll()) {
            if (country.getCountry().equals("China")){
                valor = true;
            }
        }
        if (!valor){

            Country country = new Country();
            country.setCountry("China");
            countryService.saveCountry(country);
            System.out.println("Country creat: " + country.getCountry());

            Boolean valor2 = false;
            for (Province prov : provinceService.findAll()) {
                if (prov.getProvince().equals("Zhejiang")){
                    valor2 = true;
                }
            }
            if (!valor2){

                Province province = new Province();
                province.setCountryId(country);
                province.setProvince("ZheJiang");
                provinceService.saveProvince(province);
                System.out.println("Province creat: " + province.getProvince());

                Boolean valor3 = false;
                for (City city : cityService.findAll()) {
                    if (city.getCity().equals("Hangzhou")){
                        valor3 = true;
                    }
                }
                if (!valor3){

                    City city = new City();
                    city.setProvinceId(province);
                    city.setCity("Hangzhou");
                    cityService.saveCity(city);
                    System.out.println("City creat: " + city.getCity());
                }
            }
        }

    }

} 