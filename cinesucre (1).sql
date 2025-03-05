-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-03-2025 a las 01:41:56
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinesucre`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text,
  `poster_path` varchar(200) NOT NULL,
  `vote_average` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `descripcion`, `poster_path`, `vote_average`) VALUES
(1, 'El abismo secreto', 'Dos agentes de élite son secretamente asignados a torres de vigilancia en los lados opuestos de un vasto desfiladero, para proteger al mundo de un misterioso mal que acecha en su interior. Se unen en la distancia, pero han de mantenerse alerta para defenderse del enemigo invisible. Cuando se les revela una amenaza fatal para la humanidad, deben trabajar juntos y poner a prueba su fuerza física y mental para mantener el secreto del desfiladero antes de que sea demasiado tarde.', '/3s0jkMh0YUhIeIeioH3kt2X4st4.jpg', 7.8),
(2, 'Amenaza en el aire', 'En este claustrofóbico thriller, un piloto (Mark Wahlberg) transporta en su avioneta a una teniente general (Michelle Dockery) que custodia a un testigo (Topher Grace) que va a testificar en un juicio contra la mafia. A medida que atraviesan las montañas de Alaska, las tensiones se disparan, ya que no todo el mundo a bordo es quien parece ser. Y a 3.000 metros de altura no hay escapatoria posible.', '/8T6nkYb4W8BIeafmFffyfsRciTL.jpg', 6),
(3, 'Mufasa: El rey león', 'Rafiki debe transmitir la leyenda de Mufasa a la joven cachorro de león Kiara, hija de Simba y Nala, y con Timón y Pumba prestando su estilo característico. Mufasa, un cachorro huérfano, perdido y solo, conoce a un simpático león llamado Taka, heredero de un linaje real. Este encuentro casual pone en marcha un viaje de un extraordinario grupo de inadaptados que buscan su destino.', '/dmw74cWIEKaEgl5Dv3kUTcCob6D.jpg', 7.5),
(4, 'Sonic 3: La película', 'Sonic, Knuckles y Tails se reúnen para enfrentarse a un nuevo y poderoso adversario, Shadow, un misterioso villano cuyos poderes no se parecen a nada de lo que nuestros héroes han conocido hasta ahora. Con sus facultades superadas en todos los sentidos, el Equipo Sonic tendrá que establecer una insólita alianza con la esperanza de detener a Shadow y proteger el planeta. Ver Aquí : https://justwatch.pro/es/movie/939243/sonic-the-hedgehog-3', '/3aDWCRXLYOCuxjrjiPfLd79tcI6.jpg', 7.741),
(5, 'Vaiana 2', 'Tras recibir una inesperada llamada de sus antepasados, Vaiana debe viajar a los lejanos mares de Oceanía y adentrarse en peligrosas aguas perdidas para vivir una aventura sin precedentes.', '/1b2sEjyhc6kqZD4SazdVlVLuIyh.jpg', 7.149),
(6, 'Amaran', 'La heroica historia del Major Mukund Varadarajan, un oficial del ejército indio que demostró una valentía extraordinaria durante una misión antiterrorista en el distrito de Shopian, en Cachemira.  La película captura su coraje al proteger a su nación y la devoción de su esposa Indhu Rebecaa Varghese.', '/jVP3rAtgBMFH6RrSa6r4aP4wv1T.jpg', 7.4),
(7, 'Capitán América: Brave New World', 'Tras reunirse con el recién elegido presidente de los EE. UU., Thaddeus Ross, Sam se encuentra en medio de un incidente internacional. Debe descubrir el motivo que se esconde tras un perverso complot global, antes de que su verdadero artífice enfurezca al mundo entero.', '/xVwP4GCbEfO66JSSyonnAhU3Fad.jpg', 6.2),
(8, 'La acompañante', 'La muerte de un multimillonario desencadena una cadena de acontecimientos para Iris y sus amigos durante un viaje de fin de semana a su propiedad junto al lago.', '/dZR98C2Tzefugivw21yEfYvp1G9.jpg', 7.1),
(9, 'The Brutalist', 'Cuando el visionario arquitecto László Toth y su esposa Erzsébet huyen de la Europa de posguerra en 1947 para reconstruir su legado y ver el nacimiento de la América moderna, sus vidas cambian a causa de un misterioso y adinerado cliente.', '/3BwkIAjAdQY5Nn4HqDuXue5IZx6.jpg', 7.1),
(10, 'Anora', 'Anora, una joven prostituta de Brooklyn, tiene la oportunidad de vivir una historia de Cenicienta cuando conoce e impulsivamente se casa con el hijo de un oligarca. Cuando la noticia llega a Rusia, su cuento de hadas se ve amenazado, ya que los padres parten hacia Nueva York para intentar conseguir la anulación del matrimonio.', '/n5wEFSLkm2fCtN0FVAuphrCAjf8.jpg', 7.086),
(11, 'Panda Plan', 'Poco después de que la legendaria estrella del kung fu Jackie Chan sea invitada a adoptar a un querido panda del zoo llamado Hu Hu, un famoso sindicato del crimen internacional pone sus ojos en el famoso oso y ofrece una enorme recompensa por su captura. Ante esta repentina crisis, Jackie Chan recurre a la ayuda de su agente y del feroz cuidador de Hu Hu, y el trío se embarca en una aventura en la que intentarán ser más listos que los malos en todo momento.', '/sul3eKDF9rb0wn2Q9wFfv61lOGi.jpg', 7.1),
(12, 'La sustancia', '\'Tú, pero mejor en todos los sentidos\'. Esa es la promesa de la sustancia, un producto revolucionario basado en la división celular, que crea un alter ego más joven, más bello, más perfecto.', '/w1PiIqM89r4AM7CiMEP4VLCEFUn.jpg', 7.13),
(13, 'Kraven the Hunter', 'Kraven, un hombre cuya compleja relación con su despiadado padre, Nikolai Kravinoff, le hace emprender un camino de venganza con brutales consecuencias, motivándole a convertirse no sólo en el mejor cazador del mundo, sino también en uno de los más temidos.', '/ytmJ11n9gm34D1v56myjTxMaEDJ.jpg', 6.7),
(14, 'Flow, un mundo que salvar', 'En un mundo al borde del colapso, un gato solitario pierde su hogar por una inundación y encuentra refugio en un barco con otras especies. Juntos, deberán superar diferencias y desafíos mientras navegan por un misterioso paisaje sumergido.', '/337MqZW7xii2evUDVeaWXAtopff.jpg', 8.307),
(15, 'Venom: El último baile', 'Eddie y Venom están a la fuga. Perseguidos por sus sendos mundos y cada vez más cercados, el dúo se ve abocado a tomar una decisión devastadora que hará que caiga el telón sobre el último baile de Venom y Eddie.', '/8F74DwgFxTIBNtbqSLjR7zWmnHh.jpg', 6.8),
(16, 'Wicked', 'Ambientada en la Tierra de Oz, mucho antes de la llegada de Dorothy Gale desde Kansas. Elphaba es una joven incomprendida por su inusual color verde que aún no ha descubierto su verdadero poder. Glinda es una popular joven marcada por sus privilegios y su ambición que aún no ha descubierto su verdadera pasión. Las dos se conocen como estudiantes de la Universidad Shiz, en la fantástica Tierra de Oz, y forjan una insólita pero profunda amistad. La trama abarca los acontecimientos del primer acto del musical de Broadway.', '/1ZSVA2pNpc89C07RDgsR6p0GMs7.jpg', 6.9),
(17, 'Gladiator II', 'Dieciséis años después de la muerte de Marco Aurelio, Roma está gobernada por los despiadados emperadores gemelos Geta y Caracalla. El nieto de Aurelio, Lucio Vero, vive bajo el seudónimo de Hanno con su esposa Arishat en el reino norteafricano de Numidia. El ejército romano dirigido por el general Acacio invade y conquista el reino, esclavizando a Lucio junto con otros supervivientes. Los esclavos son llevados a Ostia, donde Lucio es comprado por el maestro de cuadra Macrinus, que le promete la oportunidad de vengarse matando a Acacio si gana suficientes combates para llegar al Coliseo.', '/fbcs5AxrdXwyj1b8bGGMgC9kXrM.jpg', 6.8),
(18, 'Policán', 'Un perro y un agente de policía resultan heridos juntos en el trabajo. Una operación quirúrgica que les salva la vida cambia el curso de la historia cuando nace Policán. Mitad perro, mitad hombre, Policán ha jurado proteger y servir -siempre que no le distraigan las ardillas- mientras persigue tenazmente a su archienemigo: el supervillano felino Petey el Gato. Pero la rivalidad entre Policán y Petey se ve alterada por la llegada de un adorable gatito clon de Petey, Lil Petey, que cambia las reglas del juego para ambos.', '/cUzwACFxvpbsD8kBr1IUI4JtXz0.jpg', 7.7),
(19, 'Cónclave', 'Tras la inesperada muerte del Sumo Pontífice, el cardenal Lawrence es designado como responsable para liderar uno de los rituales más secretos y antiguos del mundo: la elección de un nuevo Papa. Cuando los líderes más poderosos de la Iglesia Católica se reúnen en los salones del Vaticano, Lawrence se ve atrapado dentro de una compleja conspiración a la vez que descubre un secreto que podría sacudir los cimientos de la Iglesia.', '/jkOgeASTlWwyKLBNblHVwWmAKhD.jpg', 7.1),
(20, 'Memorias de un caracol', '', '/sJ7bgsuC06tpC7wVl3LUW5cyKmX.jpg', 7.812),
(21, 'Alarum', '', '/cjDs56iwx4i29VQ1RbSkqO9RUyU.jpg', 5.8),
(22, 'Dhoom Dhaam', 'Durante su noche de bodas, una pareja muy peculiar trata de esquivar a matones y policías tras verse envuelta en la frenética búsqueda del misterioso «Charlie».', '/2E7me3rPi8HqaeheuD86YlpNX6k.jpg', 6.4),
(23, 'Culpa mía: Londres', 'Noah, de 18 años, se traslada de Estados Unidos a Londres con su madre, que se ha enamorado recientemente de William, un adinerado hombre de negocios británico. Noah conoce al hijo de William, el malote Nick. Pese a los esfuerzos de ambos por evitarlo, se sienten atraídos. Mientras Noah pasa el verano adaptándose a su nueva vida, su doloroso pasado la irá atrapando a la vez que se va enamorando.', '/q0HxfkF9eoa6wSVnzwMhuDSK7ba.jpg', 7.491),
(24, 'Susurros Mortales 2', '', '/qhf5wLyWLRtDV2P9MKgzYrO6xYb.jpg', 7.038),
(25, 'Solo Leveling: ReAwakening', 'Ha pasado más de una década desde que un camino llamado \"portal\" que conecta este mundo con una dimensión alternativa apareció de repente, y personas con poderes sobrehumanos llamados \"cazadores\" han despertado. Los cazadores usan sus poderes sobrehumanos para conquistar mazmorras dentro de los portales para ganarse la vida y Sung Jinwoo, un cazador del rango más bajo, es considerado como el Cazador Más débil de Toda la Humanidad. Un día se encuentra con una mazmorra doble, una mazmorra de alto nivel oculta dentro de una de bajo nivel. Frente a un Jinwoo gravemente herido, surge una misteriosa ventana hacia una misión. Al borde de la muerte, Jinwoo decide encargarse de la misión, que le convierte en la única persona capaz de subir de nivel. Largometraje formado por una recapitulación de la primera temporada de la serie de anime homónima junto con un avance exclusivo de los dos primeros episodios de la segunda temporada.', '/diPEcLFEb1uuUpApol1Bit6ck3l.jpg', 6.8),
(26, 'Robot salvaje', 'Esta aventura épica cuenta la historia de una robot, Rozzum 7-1-3-4, \"Roz\" para abreviar, que naufraga en una isla inhabitada y debe aprender a adaptarse a los entornos rigurosos construyendo relaciones con los animales de la isla y convirtiéndose en la madre adoptiva de una cría de ganso huérfana.', '/a0a7RC01aTa7pOnskgJb3mCD2Ba.jpg', 8.3),
(27, 'The Island', 'Cuando mata a su hermano, el oficial de LAPD Mark deja la ciudad para regresar a la isla en la que creció. Buscando respuestas y, en última instancia, venganza, pronto se encuentra en una sangrienta batalla con el magnate corrupto que se ha apoderado del paraíso de la isla.', '/ajb1rMiorchfRemYHZCkbV9DBg6.jpg', 6.1),
(28, 'Gru 4. Mi villano favorito', 'Gru, Lucy y las niñas -Margo, Edith y Agnes- dan la bienvenida a un nuevo miembro en la familia: Gru Junior, que parece llegar con el propósito de ser un suplicio para su padre. Gru tendrá que enfrentarse en esta ocasión a su nueva némesis Maxime Le Mal y su sofisticada y malévola novia Valentina, lo que obligará a la familia a tener que darse a la fuga. Cuarta entrega de \'Gru, mi villano favorito\'.', '/wTpzSDfbUuHPEgqgt5vwVtPHhrb.jpg', 7.1),
(29, 'De vuelta a la acción', 'Emily y Matt renunciaron hace años a ser espías de la CIA para formar una familia. Pero, cuando se descubre su tapadera, se ven arrastrados de nuevo al mundo del espionaje.', '/mAvyQ2X3767LwXE2htvAd22ucd3.jpg', 6.484),
(30, 'Elevation', 'Un padre soltero y dos mujeres se aventuran desde la seguridad de sus hogares a enfrentarse a criaturas monstruosas para salvar la vida de un niño.', '/92cd9vR6ThBqT6Pe6m5daxX0rAk.jpg', 6.5),
(31, 'Francotirador: La batalla final', 'Con el fin de evitar que un traficante de armas libere una superarma mortal, el francotirador Brandon Beckett y el agente Zero son desplegados para liderar un grupo de soldados de élite en Costa Verde. Beckett se enfrenta a un nuevo reto: dar órdenes en lugar de recibirlas. Con el tiempo y la munición agotándose, deberán superar todas las adversidades para sobrevivir.', '/iEscED4NZCHsbA5maY4jnd3Z7xh.jpg', 6.7),
(32, 'Deadpool y Lobezno', 'Un apático Wade Wilson se afana en la vida civil tras dejar atrás sus días como Deadpool, un mercenario moralmente flexible. Pero cuando su mundo natal se enfrenta a una amenaza existencial, Wade debe volver a vestirse a regañadientes con un Lobezno aún más reacio a ayudar.', '/347cCxyMXy8WkcHfsfaPaugCyPA.jpg', 7.6),
(33, 'Nosferatu', 'Historia gótica de obsesión entre una joven hechizada y el aterrador vampiro encaprichado de ella que causa un indescriptible terror a su paso.', '/jivUhECegXI3OYtPVflWoIDtENt.jpg', 6.7),
(34, 'Paddington: Aventura en la selva', 'Sigue a Paddington y la familia Brown mientras visitan a la tía Lucy en Perú, pero un misterio los envía a la selva amazónica y a las montañas peruanas. https://justwatch.pro/movie/516729/paddington-in-peru', '/q06UBJxcmnjDLVQTZZ3I9n2CTZH.jpg', 6.8),
(35, 'Mickey 17', 'Mickey Barnes se encuentra en la extraordinaria circunstancia de trabajar para un empleador que exige el máximo compromiso con el trabajo... morir, para ganarse la vida.', '/ou9BobDOvNbkFYBTlpa7x8pND4i.jpg', 7.6),
(36, 'Piglet', 'En lo profundo de las remotas colinas de los Apalaches, vive de forma solitaria Piglet, hijo de un carnicero otrora trabajador y marcado por la tragedia, cuya tranquilidad se ve truncada cuando unos millennials hambrientos de fama invaden sus tierras. En un absurdo intento de explotación, uno de ellos mata al querido cerdo de Piglet. Lo que no saben es que acaban de provocar la ira de un asesino vengativo. Indignado, Piglet despacha brutalmente a los intrusos uno a uno.', '/5wZNFUJAwyX6RCxdqrLO9lLWJ20.jpg', 5.7),
(37, 'Le Clitoris', '', '/p5i1yyQW6OpLfB59w7ZkX5lvBqD.jpg', 7.1),
(38, 'ปล้นทะลุไมล์', '', '/eLRYPOABM6Iy8w1bEyCxD38dvpU.jpg', 8.4),
(39, 'Del revés 2 (Inside Out 2)', 'Riley entra en la adolescencia y el Cuartel General de su cabeza sufre una repentina reforma para hacerle hueco a algo totalmente inesperado propio de la pubertad: ¡nuevas emociones! Alegría, Tristeza, Ira, Miedo y Asco, con años de impecable gestión a sus espaldas (según ellos...) no saben muy bien qué sentir cuando aparece con enorme ímpetu Ansiedad. Y no viene sola: le acompañan envidia, vergüenza y aburrimiento.', '/lE3DCRI7bQgHSiIuEPcFiXpiuGV.jpg', 7.6),
(40, 'Emilia Pérez', 'Rita, una infravalorada abogada que trabaja para un gran bufete más interesado en librar a los criminales de la cárcel que en llevarlos ante la justicia, es contratada por el líder de una organización criminal.', '/Al1cL3oPBgnmzm0EqIRcOT6JHFg.jpg', 6.8),
(41, 'Devara: Parte 1', 'Un intrépido hombre llamado Devara se aventura en el traicionero mundo del mar para proteger la vida de su pueblo. Ignorante de la conspiración de su hermano Bhaira, acaba transmitiendo su legado a su apacible hijo Varada.', '/q9e5viGsiNXMpEKtr8KrL4rQmVW.jpg', 7.1),
(42, 'Henry Danger: La película', 'Henry Hart se convierte en un héroe local en Dystopia después de dejar atrás Swellview. Cuando las trampas de la fama comienzan a pasar factura, se produce un giro con la presentación de Missy, una superfan que pone su mundo patas arriba.', '/dTHEq2PIRAIq4COayxraiGiaajX.jpg', 8.3),
(43, 'El señor de los anillos: La guerra de los Rohirrim', 'Explora la \"historia no contada\" del Abismo de Helm, cientos de años antes de la mítica batalla, y de su fundador, Helm Hammerhand, Rey de Rohan.', '/hpBdT0o9EckoaGmPRPtcgNZpz4F.jpg', 6.7),
(44, 'Red One', 'Tras el secuestro de Papá Noel (nombre en clave: RED ONE), el Jefe de Seguridad del Polo Norte (Dwayne Johnson) debe formar equipo con el cazarrecompensas más infame del mundo (Chris Evans) en una misión trotamundos llena de acción para salvar la Navidad.', '/dpskAcm71w5v8zQ8RmPmJiP31Om.jpg', 7.1),
(45, 'La noche eterna', 'Esta noche es como todas las demás para Mady, estudiante de día, cerrajero de noche. Pero Claire, la enigmática joven a la que ayuda esa noche, no es quien dice ser. Mady sólo tiene una noche para demostrar su inocencia en una ciudad convulsa.', '/jzZJXEa8KX5hsjCCpRaWc69e9gz.jpg', 6.9),
(46, 'Dune: Parte dos', 'Sigue el viaje mítico de Paul Atreides mientras se une a Chani y los Fremen en una guerra de venganza contra los conspiradores que destruyeron a su familia. Al enfrentarse a una elección entre el amor de su vida y el destino del universo conocido, Paul se esfuerza por evitar un futuro terrible que solo él puede prever.', '/xCHmhHeO7aOCMlzcNukGH6Q7EiD.jpg', 8.148),
(47, 'Hombre lobo', 'Blake es un hombre casado y padre de familia residente en San Francisco que hereda la remota casa donde creció en una zona rural de Oregón tras la desaparición de su propio padre, dado por muerto. En plena crisis de pareja con su enérgica esposa Charlotte, Blake la convence para tomarse un descanso de la gran ciudad y visitar la propiedad con su hija Ginger. Todo se tuerce cuando, de camino a la granja y en plena noche, la familia sufre el brutal ataque de un animal al que no consiguen ver y, en un intento desesperado por huir, se atrincheran dentro de la casa mientras la criatura merodea por la zona. Pero, con el paso de las horas, Blake comienza a comportarse de un modo extraño y a convertirse en algo irreconocible, y Charlotte se verá obligada a decidir si esa monstruosidad es más letal que el peligro que acecha en el exterior.', '/k6VBhNc66CdGTEdw7sR7GBt7AFY.jpg', 6.5),
(48, 'El Jardinero', 'Serge guarda un secreto de Estado. Él, su familia y el jardinero Leo aparecen en una lista negra del gobierno. Intentan idear un plan para seguir con vida.', '/x9SrxVaRhBNKf95vns1ti13yzl0.jpg', 6.291),
(49, 'Absolution', 'Un curtido y peligroso gangster (Liam Neeson) descubre que está empezando a perder la memoria. Decidido a enmendar las cosas con su hija y rectificar los errores del pasado, antes de que sea demasiado tarde intentará hacer lo que sea para redimirse. Pero las garras del mundo criminal no lo soltarán tan fácilmente y se verá obligado a enfrentarse a la organización para la que lleva más de 20 años trabajando.', '/6QsBGrKAs6pgypqkqVVyHICJnpY.jpg', 5.898),
(50, 'Aún Estoy Aquí', 'Brasil, 1971. Un país en las garras de una dictadura militar. Una madre se ve obligada a reinventarse cuando la vida de su familia se ve destrozada por un acto de violencia arbitraria.', '/bp8VfiqYqkQOzf6e8LBv4m53gxU.jpg', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'Snowy', 'Evdacar@gmail.com', 'scrypt:32768:8:1$7zD0khzvWztKziXC$6fbd700e0be075c40bc50cf8f513f25c80c69b0569342d67dddf6356e42478816b00fea8c3d1dd64df92aa7010d54326c5c1c3538624c1e3fb1b765045d91425');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `email`, `password`) VALUES
(1, 'Ever', 'Ever@gmail.com', 'scrypt:32768:8:1$tKQxKRMzRX0wc7CO$685c2667ef17b817a72922312039f99f041aeab712999e062037ef059411adf2a695c3fc8dbfca6e6eaa26b352d7bd11a01fa215ead00019b8e90d3008ec05f9'),
(2, 'Daniel Marica', 'DanMarica@gmail.con', 'scrypt:32768:8:1$oea0LCdHAkg9LXGW$3eeaa3f9323f71bf0e1e7f988f5271c5c7ff3c57307a1c91f4473aff43075f209da2890df154ceedc75dfa599012df2678a5b4f5adfd999d9d8de5b5be9882e4');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
