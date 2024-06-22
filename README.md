# InfoCuy REST API 

> [!NOTE]
> Proyecto en proceso.

> Se necesita cuatro capas para completar el proyecto mediante SpringBoot.
## Capas terminadas:

- **Capa Model o Dominio:** Base donde se manejara la lógica de nuestra base de datos con el modelo de aplicación.

- **Capa Repository:** En ella se manejara las solicitudes entre el Model, lo cúal se agregarán las extensiones para después ser manejadas con el CRUD.

## Capas en proceso:

- **Capa de Service:** Esta capa debemos manejarla con mucho cuidado, ya que se establecerá la lógica de nuestros en endpoint y sus respectivas solicitudes.

- **Capa de RestController:** Controla el alcance y la gestiona con información relacionada con la sesión para la solicitud.

Aún falta mucho que avanzar y hasta no completar unos previos cambios que no (se establecen) por su debido funcionamiento, ya que pueden contener un rumbo diferente a lo que se desea, por lo qué aún se tiene en aviso.

## Cambios

- Al finalizar la capa tres se agregaran los cambios que si o si, se reflejarán en nuestro proyecto y serán agregadas en este archivo.

### Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/3.3.1/maven-plugin/reference/html/)
* [Create an OCI image](https://docs.spring.io/spring-boot/docs/3.3.1/maven-plugin/reference/html/#build-image)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/docs/3.3.1/reference/htmlsingle/index.html#using.devtools)
* [JDBC API](https://docs.spring.io/spring-boot/docs/3.3.1/reference/htmlsingle/index.html#data.sql)
* [Spring Web](https://docs.spring.io/spring-boot/docs/3.3.1/reference/htmlsingle/index.html#web)

### Guides

The following guides illustrate how to use some features concretely:

* [Accessing Relational Data using JDBC with Spring](https://spring.io/guides/gs/relational-data-access/)
* [Managing Transactions](https://spring.io/guides/gs/managing-transactions/)
* [Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)

### Maven Parent overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the
parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.

