package com.zosh.InfoCuy.Model;

import java.time.LocalDateTime;

import ch.qos.logback.core.spi.ConfigurationEvent.EventType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "events")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int eventId;

    @ManyToOne
    @JoinColumn(name = "fk_district", nullable = false)
    private District district;

    @ManyToOne
    @JoinColumn(name = "fk_status", nullable = false)
    private Status status;

    @ManyToOne
    @JoinColumn(name = "fk_event_type", nullable = false)
    private EventType eventType;

    @Column(name = "event_name", nullable = false)
    private String eventName;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "photo", nullable = false)
    private String photo;

    @Column(name = "start_date", nullable = false)
    private LocalDateTime startDate;

    @Column(name = "end_date", nullable = false)
    private LocalDateTime endDate;

    @Column(name = "location", nullable = false)
    private String location;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;
}