package com_test.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Progress")
public class Mark {
    @EmbeddedId
    private MarkKey primaryKey;

    public Mark() {
    }

    public Mark(MarkKey primaryKey) {
        this.primaryKey = primaryKey;
    }

    public MarkKey getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(MarkKey primaryKey) {
        this.primaryKey = primaryKey;
    }

    @Override
    public String toString() {
        return primaryKey.toString();
    }
}
