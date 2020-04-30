+++
title = "¿Necesitamos los Daily Standup?"
date = 2020-04-30T12:46:36+02:00
draft = true

+++

Los Daily Standup son una de las herramientas más usadas desde que se popularizó el uso de [Scrum](https://www.scrum.org/resources/what-is-a-daily-scrum) pero, como toda herramienta, hay que pensar muy bien qué aporta al equipo.

La forma más común de ejecutar el Daily es respondiendo las preguntas:
* ¿Qué hiciste ayer?
* ¿Qué vas a hacer hoy?
* ¿Qué impedimentos o bloqueos no te están dejando ejecutar tu trabajo?

Nosotros dejamos de hacer Dailies hace un tiempo.
Somos un equipo [completamente distribuido](https://timezone.io/team/spring-cloud-services) y experimentamos cambiando la frecuencia de cada reunión que teníamos y pasamos de tener Dailies, una retro y un planning cada dos semanas a no tener Dailies y hacer retros y planning cada semana.

## ¿Cómo se debe enfocar un Daily Standup?

Teniendo el backlog delante y ver en qué se está trabajando en ese momento.
Una persona, que va rotando cada día, va leyendo qué hay en la columa de tareas que se están llevando a cabo. De esta forma, sólo hay una persona hablando y no los N componentes del equipo diciendo, todo OK. Salvo que alguien necesite ayuda o quiera comentar algo, pero es que, **que se espere a la Daily para pedir ayuda, ¡Está muy mal!** Hay que pedir ayuda en cuando la necesites, y no esperar al día siguiente o al final de tu día para hacerlo.

Para nosotros, el Daily no era lo que todo el mundo repetía: qué hice ayer, qué hago hoy y qué me bloquea. Lo veo demasiada información para un Daily, sobre todo en equipos relativamente grandes.

## Lo que de verdad importa

Lo principal es entender la dirección a la que se quiere ir, si estás en un entorno donde hay confianza en el equipo el estado individual no debería ser relevante. Además, qué mejor forma de decirle al equipo que confías en todas las personas que lo componen que dejando de individualizar el trabajo y tratando las metas como objetivos comunes.
Lo único en lo que hay que reinicidir periódicamente es en si tenemos claros nuestros objetivos y en si tenemos todo lo que necesitamos para alcanzarlos.
Por eso, nosotros le quitamos el peso a las Dailies y, cada semana, conjuntamente, entre otras cosas, nos preguntamos:
* En un planning: ¿Tenemos claro nuestros objetivos?
* En una retrospectiva: ¿Tenemos todo lo que necesitamos para alcanzarlos?

## ¿Cómo salimos del blucle?

En nuestro, tenemos una plantilla de experimentos que decidimos aplicar, y fallar suponía volver a los Dailies. 
Todos apreciamos el tener una reunión menos cada día que apenas nos aportaba al equipo.
Desde que empezó el experimento, la mayoría empezamos a escribir, desde ese mismo día en las historias y automatizamos que se publicaran los comentarios en Slack. Así que todo el equipo, en pocos días, acabó cayendo en la tendencia.
Ser un equipo completamente distribuido en diferentes franjas horarias hace que la comunicación asíncrona sea siempre lo deseado, y si hay algún bloqueo o progreso significativo, lo escribimos en la tarea y avisamos al equipo al momento y no a la mañana siguiente.

## Herramientas que usamos

Tenemos configurado para que cada vez que alguien haga un commit, abra una Pull quest o comente en una issue se publique en Slack, por lo que podemos, si queremos, leer toda esa información.
Para recordarnos las Pull Requests abiertas, usamos [Pull Panda](https://pullreminders.com), un bot que tenemos integrado con Slack y deja un mensaje en el canal si algo lleva más de un día esperando ser revisado, además te manda un mensaje directo cuando alguien te asigna para revisar algo.
La mayoría venimos de practicar [XP](https://en.wikipedia.org/wiki/Extreme_programming) de forma [muy, muy, muy exigente](https://builttoadapt.io/pivotal-labs-a-very-different-type-of-consultancy-9b47a27f0388) durante años. Por lo que practicamos Pair Programming a menudo, evitando así silos de información y pudiendo compartir, con empatía, las decisiones que se están tomando.
Una de las primeras cosas que intento añadir a cada equipo son los [Acuerdos de Trabajo del Equipo](https://www.uvm.edu/sites/default/files/working-agreements-defined.pdf) y enfatizar en la [Definición de Completada](https://www.agilealliance.org/glossary/definition-of-done) para cada historia. El tener retrospectivas con mucha frecuencia, hace que, constantemente, salgan elementos para añadir y quitar en cada una de ellas.

## Conclusiones

Cada equipo es un mundo, y que a nosotros nos haya funcionado esta forma de trabajar, en este contexto, con estas personas, desarrollando estos productos, no quiere decir que lo mismo le funcione a otros equipos, ni sea lo mejor, ni que no se pueda mejorar.
Es preferible, en entornos distribuidos, la comunicación asíncrona y al alcance de todos.
Los Dailies son una gran herramienta, si se ejecutan bien y aportan algo a todo el equipo pero es más importante tener claro el rumbo a saber exactamente quién hace qué.

