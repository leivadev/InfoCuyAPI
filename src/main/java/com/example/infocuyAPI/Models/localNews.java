package com.zosh.InfoCuy.Model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "local_news")
public class localNews {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int localNewsId;

    @ManyToOne
    @JoinColumn(name = "fk_district", nullable = false)
    private District district;

    @ManyToOne
    @JoinColumn(name = "fk_author", nullable = false)
    private Author author;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "photo", nullable = false)
    private String photo;

    @Column(name = "publication_date", nullable = false)
    private LocalDate publicationDate;
}