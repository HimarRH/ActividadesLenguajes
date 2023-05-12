<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="ite/@nombre"/></title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="ite/empresa" />
                </h1>
                <p>El número de teléfono es: <xsl:value-of select="ite/telefono" /></p>
                <p>La web es: <a href="https://institutotecnologico.edix.com"> <xsl:value-of select="ite/@web"/></a></p>
                
                <h2>Aquí tienes una lista de los profesores de: <xsl:value-of select="ite/@nombre"/></h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Id Profesor</th>
                            <th>Nombre</th>
                            <th>Asignatura</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ite/profesores/profesor">
                            <tr>
                                <td><xsl:value-of select="id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="id ='1'">Lenguajes de marcas</xsl:when>
                                        <xsl:when test="id ='2'">BBDD</xsl:when>
                                        <xsl:when test="id ='3'">Sistemas</xsl:when>
                                        <xsl:when test="id ='4'">Programación</xsl:when>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table> 
                <h2>Nuestro equipo de dirección</h2>
                <ol>
                    <li>Directora: 
                        <ul>
                            <li> Nombre: <xsl:value-of select="ite/director/nombre"/></li>
                            <li> Despacho: <xsl:value-of select="ite/director/despacho"/></li>
                        </ul>
                    </li> 
                    <li>Jefe de estudios: 
                        <ul>
                            <li> Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                            <li> Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                        </ul>
                    </li>
                </ol>
                <h2>Nuestro ciclos FP</h2> 
                <table border="1">
                    <thead>
                        <tr>
                            <th>Ciclo</th>
                            <th>Grado</th>
                            <th>Año del decreto</th>
                            <th>Id del ciclo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="ite/ciclos/ciclo">
                            <tr>
                                <td><a href="https://www.edix.com/es/fp/"><xsl:value-of select="nombre"/></a></td>
                                <td><xsl:value-of select="grado"/></td>
                                <td><xsl:value-of select="decretoTitulo/@año"/></td>
                                <td><xsl:value-of select="@id"/></td>
                            </tr>
                        </xsl:for-each>      
                    </tbody>
                </table> 
                <h2>Obten más información sobre cualquiera de nuestros grados</h2>
                <form actio="procesarInfo.jsp" method="get">
                    <fieldset>
                        <legend>Tus datos personales</legend>
                            Nombre : <input type="text" name="nombre" placeholder="Escribe tu nombre"/>
                            Email : <input type="email" name="email" placeholder="Introduce tu email"/>
                            <br/>
                            <label for="grado">¿Qué grado te interesa?</label>
                            <br/>
                            <select name="grado" id="grado">
                                <option value="ASIR"><xsl:value-of select="ite/ciclos/ciclo[@id='ASIR']/nombre"/></option>
                                <option value="DAW"><xsl:value-of select="ite/ciclos/ciclo[@id='DAW']/nombre"/></option>
                                <option value="DAM"><xsl:value-of select="ite/ciclos/ciclo[@id='DAM']/nombre"/></option>
                            </select>
                            <br/>
                            <br/>
                            <label for="observaciones">Explicanos tus dudas : </label>
                            <br/>
                            <textarea style="resize: none;" rows="5" cols="50" name="observaciones" id="observaciones"></textarea>
                            <br/>
                            <label for="terminos">¿Acepta los terminos de uso? </label>
                            <br/>	
                            He leido y acepto los terminos de uso <input type="checkbox" name="terminos" value="Y" />
                            <br/>	
                            <br/>	
                            <input type="submit" value="Enviar datos" />
                    </fieldset> 
                </form>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>