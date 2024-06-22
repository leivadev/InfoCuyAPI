package com.zosh.InfoCuy.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tourist_attraction_types")
public class touristAttractionType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int touristAttractionTypeId;

    @Column(name = "tourist_attraction_type_name", nullable = false)
    private String touristAttractionTypeName;
}