package com.zosh.InfoCuy.Model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "public_service_types")
public class publicServiceType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int publicServiceTypeId;

    @Column(name = "public_service_type_name", nullable = false)
    private String publicServiceTypeName;
}