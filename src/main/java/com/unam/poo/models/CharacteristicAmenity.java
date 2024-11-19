package com.unam.poo.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
 
@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "characteristic_amenity", schema = "public", catalog = "playground")
public class CharacteristicAmenity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "characteristic_id")
    private Integer characteristicId;
    @Basic
    @Column(name = "characteristic_name")
    private String characteristicName;


    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "amenity_id", nullable = false)
    private Amenity amenityId;


}
