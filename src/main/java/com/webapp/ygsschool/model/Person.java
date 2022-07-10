package com.webapp.ygsschool.model;

import com.webapp.ygsschool.annotation.FieldsValueMatch;
import com.webapp.ygsschool.annotation.PasswordValidator;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
@Entity
@FieldsValueMatch(
        field = "pwd",
        fieldMatch = "confirmpwd",
        message = "Passwords do not match."
)
public class Person extends BaseFormEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int personId;

    @NotBlank(message = "Name must not be blank")
    @Size(min = 3, message = "Name must be at least 3 characters long")
    private String name;

    @NotBlank(message = "Email must not be blank")
    @Email(message = "Please provide a valid email address")
    private String email;

    @NotBlank(message = "Password must not be blank")
    @Size(min = 5, message = "Password must be at least 4 characters long")
    @PasswordValidator
    private String pwd;

    /*
    * @Transient annotation make spring consider that this field is not compulsory for db table (ignore)*/

    @NotBlank(message = "Password must not be blank")
    @Transient
    private String confirmpwd;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST, targetEntity = Roles.class)
    @JoinColumn(name = "role_id", referencedColumnName = "roleId", nullable = false)
    private Roles roles;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Address.class)
    @JoinColumn(name = "address_id", referencedColumnName = "addressId", nullable = true)
    private Address address;

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "class_id", referencedColumnName = "classId", nullable = true)
    private WisdomClass wisdomClass;
}
