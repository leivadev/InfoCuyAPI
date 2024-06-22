package com.zosh.InfoCuy.Model;

import javax.persistence.*;
import java.time.LocalDateTime;
@Entity
@Table(name = "public_services")
public class publicService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int publicServiceId;

    @ManyToOne
    @JoinColumn(name = "fk_district", nullable = false)
    private District district;

    @ManyToOne
    @JoinColumn(name = "fk_public_service_type", nullable = false)
    private publicServiceType publicServiceType;

    @Column(name = "public_service_name", nullable = false)
    private String publicServiceName;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "opening_hours")
    private LocalDateTime openingHours;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;
}