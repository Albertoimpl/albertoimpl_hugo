+++
title = "Cuestionando los Daily Standup"
date = 2020-04-30T12:46:36+02:00
draft = true

+++

Los Daily Standup son una de las herramientas m&aacute;s usadas desde que se populariz&oacute; el uso de [Scrum](https://www.scrum.org/resources/what-is-a-daily-scrum) pero, como toda herramienta, hay que pensar muy bien qu&eacute; aporta al equipo.

La forma m&aacute;s com&uacute;n de ejecutar el Daily es respondiendo las preguntas:
* &iquest;Qu&eacute; hiciste ayer?
* &iquest;Qu&eacute; vas a hacer hoy?
* &iquest;Qu&eacute; impedimentos o bloqueos no te est&aacute;n dejando ejecutar tu trabajo?

Nosotros dejamos de hacer Dailies hace un tiempo.
Somos un equipo [completamente distribuido](https://timezone.io/team/spring-cloud-services) y experimentamos cambiando la frecuencia de cada reuni&oacute;n que ten&iacute;amos y pasamos de tener Dailies, una retro y un planning cada dos semanas a no tener Dailies y hacer retros y planning cada semana.

## &iquest;C&oacute;mo se debe enfocar un Daily Standup?

Teniendo el backlog delante y ver en qu&eacute; se est&aacute; trabajando en ese momento.
Una persona, que va rotando cada d&iacute;a, va leyendo qu&eacute; hay en la columa de tareas que se est&aacute;n llevando a cabo. De esta forma, s&oacute;lo hay una persona hablando y no los N componentes del equipo diciendo, todo OK. Salvo que alguien necesite ayuda o quiera comentar algo, pero es que, **que se espere a la Daily para pedir ayuda, ¡Est&aacute; muy mal!** Hay que pedir ayuda en cuando la necesites, y no esperar al d&iacute;a siguiente o al final de tu d&iacute;a para hacerlo.

Para nosotros, el Daily no era lo que todo el mundo repet&iacute;a: qu&eacute; hice ayer, qu&eacute; hago hoy y qu&eacute; me bloquea. Lo veo demasiada informaci&oacute;n para un Daily, sobre todo en equipos relativamente grandes.

## Lo que de verdad importa

Lo principal es entender la direcci&oacute;n a la que se quiere ir, si est&aacute;s en un entorno donde hay confianza en el equipo el estado individual no deber&iacute;a ser relevante. Adem&aacute;s, qu&eacute; mejor forma de decirle al equipo que conf&iacute;as en todas las personas que lo componen que dejando de individualizar el trabajo y tratando las metas como objetivos comunes.
Lo &uacute;nico en lo que hay que reinicidir peri&oacute;dicamente es en si tenemos claros nuestros objetivos y en si tenemos todo lo que necesitamos para alcanzarlos.
Por eso, nosotros le quitamos el peso a las Dailies y, cada semana, conjuntamente, entre otras cosas, nos preguntamos:
* En un planning: &iquest;Tenemos claro nuestros objetivos?
* En una retrospectiva: &iquest;Tenemos todo lo que necesitamos para alcanzarlos?

## &iquest;C&oacute;mo salimos del blucle?

En nuestro, tenemos una plantilla de experimentos que decidimos aplicar, y fallar supon&iacute;a volver a los Dailies. 
Todos apreciamos el tener una reuni&oacute;n menos cada d&iacute;a que apenas nos aportaba al equipo.
Desde que empez&oacute; el experimento, la mayor&iacute;a empezamos a escribir, desde ese mismo d&iacute;a en las historias y automatizamos que se publicaran los comentarios en Slack. As&iacute; que todo el equipo, en pocos d&iacute;as, acab&oacute; cayendo en la tendencia.
Ser un equipo completamente distribuido en diferentes franjas horarias hace que la comunicaci&oacute;n as&iacute;ncrona sea siempre lo deseado, y si hay alg&uacute;n bloqueo o progreso significativo, lo escribimos en la tarea y avisamos al equipo al momento y no a la ma&ntilde;ana siguiente.

## Herramientas que usamos

Tenemos configurado para que cada vez que alguien haga un commit, abra una Pull quest o comente en una issue se publique en Slack, por lo que podemos, si queremos, leer toda esa informaci&oacute;n.
Para recordarnos las Pull Requests abiertas, usamos [Pull Panda](https://pullreminders.com), un bot que tenemos integrado con Slack y deja un mensaje en el canal si algo lleva m&aacute;s de un d&iacute;a esperando ser revisado, adem&aacute;s te manda un mensaje directo cuando alguien te asigna para revisar algo.
La mayor&iacute;a venimos de practicar [XP](https://en.wikipedia.org/wiki/Extreme_programming) de forma [muy, muy, muy exigente](https://builttoadapt.io/pivotal-labs-a-very-different-type-of-consultancy-9b47a27f0388) durante a&ntilde;os. Por lo que practicamos Pair Programming a menudo, evitando as&iacute; silos de informaci&oacute;n y pudiendo compartir, con empat&iacute;a, las decisiones que se est&aacute;n tomando.
Una de las primeras cosas que intento a&ntilde;adir a cada equipo son los [Acuerdos de Trabajo del Equipo](https://www.uvm.edu/sites/default/files/working-agreements-defined.pdf) y enfatizar en la [Definici&oacute;n de Completada](https://www.agilealliance.org/glossary/definition-of-done) para cada historia. El tener retrospectivas con mucha frecuencia, hace que, constantemente, salgan elementos para a&ntilde;adir y quitar en cada una de ellas.

## Conclusiones

Cada equipo es un mundo, y que a nosotros nos haya funcionado esta forma de trabajar, en este contexto, con estas personas, desarrollando estos productos, no quiere decir que lo mismo le funcione a otros equipos, ni sea lo mejor, ni que no se pueda mejorar.
Es preferible, en entornos distribuidos, la comunicaci&oacute;n as&iacute;ncrona y al alcance de todos.
Los Dailies son una gran herramienta, si se ejecutan bien y aportan algo a todo el equipo pero es m&aacute;s importante tener claro el rumbo a saber exactamente qui&eacute;n hace qu&eacute;.

