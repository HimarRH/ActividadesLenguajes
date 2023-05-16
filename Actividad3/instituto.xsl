<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="ite/empresa"/></title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <div class="center-title">
                    <div id="name">
                        <h1><xsl:value-of select="ite/@nombre"/></h1>
                    </div>
                    <div id="info">
                        <p>Telefono: <xsl:value-of select="ite/telefono"/></p>
                        <p>Web:<a href="https://institutotecnologico.edix.com" target="_blank"> <xsl:value-of select="ite/@web"/></a></p>
                    </div>
                </div>
                <h3>Profesores</h3>
                <div class="teaching-staff">
                     <table>
                        <thead>
                            <tr>
                                <th>Id_Profesor</th>
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
                </div>
                <h3>Direccion</h3>
                <div class="staff">
                    <ol>
                        <li>Directora
                            <ul>
                                <li><xsl:value-of select="ite/director/nombre"/></li>
                                <li><xsl:value-of select="ite/director/despacho"/></li>
                            </ul>
                        </li>
                        <li>Jefe de Estudios
                            <ul>
                                <li><xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                                <li><xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                            </ul>
                        </li>
                    </ol>
                </div>
                <h3>Cursos</h3>
                <div class="courses">              
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Ciclo</th>
                            <th>Grado</th>
                            <th>Decreto</th>
                        </tr>
                        <xsl:for-each select="ite/ciclos/ciclo">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><a href="https://www.edix.com/es/fp/" target="_blank"><xsl:value-of select="nombre"/></a></td>
                                <td><xsl:value-of select="grado"/></td>
                                <td><xsl:value-of select="decretoTitulo/@año"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="contact">
                    <h3>Contacto</h3>
                    <form actio="procesarInfo.jsp" method="get">
                    <fieldset>
                        <legend>Datos</legend>
                            Nombre : <input type="text" name="nombre" placeholder="Nombre"/>
                            Email : <input type="email" name="email" placeholder="Email"/>
                            <br/>
                            <br/>
                            <label for="grado">Grado</label>
                            <br/>
                            <select name="grado" id="grado">
                                <option value="ASIR"><xsl:value-of select="ite/ciclos/ciclo[@id='ASIR']/nombre"/></option>
                                <option value="DAW"><xsl:value-of select="ite/ciclos/ciclo[@id='DAW']/nombre"/></option>
                                <option value="DAM"><xsl:value-of select="ite/ciclos/ciclo[@id='DAM']/nombre"/></option>
                            </select>
                            <br/>
                            <br/>
                            <label for="observaciones">Comentarios : </label>
                            <br/>
                            <textarea style="resize: none;" rows="5" cols="50" name="observaciones" id="observaciones"></textarea>	
                            <br/>
                            <label for="terminos">¿Acepta los terminos de uso? </label>
                            <br/>	
                                He leido y acepto los terminos de uso <input type="checkbox" name="terminos" value="Y" />
                            <br/>		
                            <input type="submit" value="Enviar" id="button"/>
                    </fieldset> 
                </form>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>