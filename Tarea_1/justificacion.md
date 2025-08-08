# Modelo constelación

Se escogió este moodelo porque hay dos tipos de información que se requiere hacer reportes siendo las tablas de hecho compras y ventas. Algunas de sus dimensiones se comparten, el modelo estrella no era apropiado porque esas dos tablas no pueden juntarse al ser distintas cosas para analizar y el modelo copo de nieve de igual forma es descartado por la misma razón.

En cada tabla de hecho se guarda el costo o el precio porque son valores cambiantes e historicos donde no se podría guardar en producto ya que implicaría repetir el producto pero con precio diferente.