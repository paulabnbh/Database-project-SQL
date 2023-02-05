# Videoclub database con SQL

_Este proyecto consiste en limpiar y organizar una base de datos que cuenta con siete tablas diferentes para poder relacionarlas entre sí a través de SQL_

![portada](https://github.com/paulabnbh/Database-project-SQL/imagenes/blob/main/2.jpeg?raw=true)

## Antes de empezar 📋

El repo contiene diferentes carpetas con documentos dentro de ellas. Aquí están los detalles de cada una:
    
1. **Data cleaning**. Dentro de esta carpeta encontraremos el código en python para la limpieza y exportación de las 7 tablas de la base de datos.
    
2. **SQL**. En esta carpeta tenemos diferentes documentos.
        - ***01-import-data-to-sql*** ➡ este documento contiene el código para importar las tablas mencionadas anteriormente a SQL. Es importante editar el 'conector' con tu usuario y contraseña donde se indica 'USER' y 'PASSWORD' para que el código corra correctamente.
        - ***02-creating-database-videoclub-query*** ➡ query de SQL para crear la estructura de la base de datos.
        - ***03-EER-Diagram-Videoclub*** ➡ imagen de las relaciones entre las tablas de la base de datos.
        - ***04-model-synchronization*** ➡ query de SQL en la que se sincroniza la base de datos con el diagrama.
        - ***05-bonus-queries*** ➡ queries que muestra diferente información de la base de datos a través de las relaciones creadas.



## Comencemos 🚀

### Data cleaning

Las tablas de la base de datos no han necesitado de una limpieza muy profunda, sino que se han modificado de manera que puedan relacionarse correctamente en SQL. A continuación vemos los detalles de la limpieza.

En una primera revisión de las tablas, no he encontrado valores nulos más que en la columna *'original_language_id'*, la cual he eliminado al completo ya que los valores nulos estaban en la columna completa. Además, he eliminado la columna *'last_update'*, columna que se encontraba en todas las tablas y en todas ellas con la misma información. Puesto que no aportaba valor, la he retirado.

He creado una relación entre la tabla *'actors'* y *'films'* a través de la tabla *'oldhdd'* que contenía información de ambas. Además, la tabla *'oldhdd'* nos permitía vincular una relación entre la tabla *'category'* y *'films'* a través de las columnas *category_id* y *title*. Sin embargo, *'oldhdd'* no nos daba la categoría de todas las películas, y al no tener otra forma de conocer la categoría del resto de películas, les he asignado un '0' como 'desconocido'.

De esta forma, la relación entre películas y actores está únicamente a través de sus ID, y la categoría se relaciona sólo con films.


### SQL

#### Importar los datos a SQL.

En este documento encontramos el código que nos permite importar las tablas a SQL. Es importante modificar el código del conector incluyendo tu usuario y contraseña para que elcódigo corra correctamente.

#### EER Diagram

A continuación podemos ver el diagrama con las relaciones entre cada una de las tablas y el contenido de cada una de ellas.

![EERDiagram](https://github.com/paulabnbh/Database-project-SQL/SQL/blob/main/03-EER-Diagram-Videoclub.jpeg?raw=true)

#### Bonus queries

Este documento SQL incluye diferentes queries que nos permiten ver la información de la base de datos y las relaciones que hay entre las diferentes tablas. Las queries corresponden a las siguientes 'preguntas':

*1. Duración media de alquiler por película.
*2. Número de actores en cada película.
*3. Categoría más frecuente.
*4. Las tres películas más largas.
*5. Película con el coste de sustitución más alto.
*6. Categoría por película.
*7. Idioma por película.
*8. Película y su descripción.
*9. Los cinco actores con el mayor número de películas.
*10. Top 3 categorías con el mayor número de películas.












