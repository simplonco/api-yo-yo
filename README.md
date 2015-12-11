API yoyo connecté
===============
API qui doit servir au dinner de lancement de la foundation Simplon.co

Exemples
----------------------
Faire descendre le yoyo de 150 pas avec une vitesse de 80%

    /turn&direction=down?step=150?speed=80

Faire monter le yoyo de 200 pas avec une vitesse de 90%

    /up&step=200?speed=90

Faire descendre le yoyo de 200 pas avec une vitesse de 90%

    /down&step=200?speed=90

Documentation
----------------------

### Turn

```
/turn
```
**Parameters**

Nom            | Type                   | Description                                        | Valeurs  | Valeur par défault
---------------|------------------------|----------------------------------------------------|----------|------------------
**direction**  | Chaîne de charactaires | Sens de rotation du moteur                         | up, down | down
**step**       | Nombre                 | Le nombre de tour effectué par le moteur pas à pas | 0 - *    | 100
**speed**      | Nombre                 | Vitesse de rotation du moteur                      | 0 - 100  | 75

**Exemples**

    /turn&direction=down?step=150?speed=80

### Down

    /down

**Parameters**

Nom      | Type          | Description                                        | Valeurs | Valeur par défault
---------|---------------|----------------------------------------------------|---------|------------------
**step** | Nombre        | Le nombre de tour effectué par le moteur pas à pas | 0 - *   | 100
**speed**| Nombre        | Vitesse de rotation du moteur                      | 0 - 100 | 75

**Exemples**

    /down&step=200?speed=90


### Up

    /up

**Parameters**

Nom      | Type          | Description                                        | Valeurs | Valeur par défault
---------|---------------|----------------------------------------------------|---------|------------------
**step** | Nombre        | Le nombre de tour effectué par le moteur pas à pas | 0 - *   | 100
**speed**| Nombre        | Vitesse de rotation du moteur                      | 0 - 100 | 75

**Exemples**

    /up&step=200?speed=90
