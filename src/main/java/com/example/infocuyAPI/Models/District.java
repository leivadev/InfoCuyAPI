package com.zosh.InfoCuy.Model;


import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "districts")
public class District {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int districtId;

    @ManyToOne
    @JoinColumn(name = "fk_province", nullable = false)
    private Province province;

    @Column(name = "district_name", nullable = false)
    private String districtName;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<touristAttraction> touristAttractions;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<Event> events;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<localNews> localNews;

    @OneToMany(mappedBy = "district", cascade = CascadeType.ALL)
    private List<publicService> publicServices;
}