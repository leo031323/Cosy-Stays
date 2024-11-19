package com.unam.poo.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "publication")

public class Publication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "publication_id", nullable = false)
    private Integer id;

    @Basic
    @Column(name = "state", length = 20)
    private String state = "active";
    @Basic
    @Column(name = "date_time")
    private LocalDateTime dateTime = LocalDateTime.now();
    @Basic
    @NotBlank(message = "")
    @Column(name = "street", length = 100)
    private String street;

    @Basic
    @Column(name = "height")
    private Integer height;

    @Basic
    @Column(name = "bedroom")
    private Integer bedroom;

    @Basic
    @Column(name = "bathroom")
    private Integer bathroom;

    @Basic
    @Column(name = "garage")
    private Integer garage;

    @Basic
    @Column(name = "environment")
    private Integer livingRoom;


    @Basic
    @Column(name = "covered_area")
    private Double coveredArea;


    @Basic
    @Column(name = "total_area")
    private Double totalArea;

    @Basic
    @Column(name = "price")
    private Double price;
    @Basic
    @Column(name = "title")
    private String title;
    @Basic
    @Column(name = "description", length = 500)
    private String description;


    @Basic
    @Column(name = "longitude")
    private Double longitude;

    @Basic
    @Column(name = "latitude")
    private Double latitude;


    @Basic
    @Column(name = "imagen1")
    private String image1;


    @NotNull(message = "The type field is mandatory")
    @ManyToOne(optional = false)
    @JoinColumn(name = "type_id", nullable = false)
    private Type typeId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "city_id", nullable = false)
    private City cityId;


    @ManyToMany
    @JoinTable(name = "publication_tie_characteristic",
            joinColumns = @JoinColumn(name = "publication_id"),
            inverseJoinColumns = @JoinColumn(name = "characteristic_id"))
    private List<CharacteristicAmenity> characteristicAmenities;


    @OneToMany(mappedBy = "publicationId", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PhotoPublication> images;
}