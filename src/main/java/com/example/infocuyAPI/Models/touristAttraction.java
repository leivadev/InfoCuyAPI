package com.zosh.InfoCuy.Model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
@Entity
@Table(name = "tourist_attractions")
public class touristAttraction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int touristAttractionId;

    @ManyToOne
    @JoinColumn(name = "fk_district", nullable = false)
    private District district;

    @ManyToOne
    @JoinColumn(name = "fk_status", nullable = false)
    private Status status;

    @ManyToOne
    @JoinColumn(name = "fk_tourist_attraction_type", nullable = false)
    private touristAttractionType touristAttractionType;

    @Column(name = "tourist_attraction_name", nullable = false)
    private String touristAttractionName;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "photo", nullable = false)
    private String photo;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "opening_hours", nullable = false)
    private LocalDateTime openingHours;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "website")
    private String website;
}