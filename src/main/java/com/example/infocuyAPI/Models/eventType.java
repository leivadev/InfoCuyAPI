package com.zosh.InfoCuy.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "event_types")
public class eventType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int eventTypeId;

    @Column(name = "event_type_name", nullable = false)
    private String eventTypeName;
}