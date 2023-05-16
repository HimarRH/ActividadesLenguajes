<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="ite/empresa"/></title>
            </head>
            <body>
                <div class="center-title">
                    <h1><xsl:value-of select="ite/@nombre"/></h1>
                    <p>Telefono: <xsl:value-of select="ite/telefono"/></p>
                    <p>Web:<a href="https://institutotecnologico.edix.com"> <xsl:value-of select="ite/@web"/></a></p>
                </div>
                <div class="teaching-staff">
                    <h3>Profesores</h3>
                    <table border="1">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                        </tr>
                        <xsl:for-each select="ite/profesores/profesor">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
                <div class="staff">
                    <h3>Direccion</h3>
                    <ol>
                        <li>Directora
                            <ul>
                                <li><xsl:value-of select="ite/director/nombre"/></li>
                                <li><xsl:value-of select="ite/director/edificio"/></li>
                                <li><xsl:value-of select="ite/director/despacho"/></li>
                            </ul>
                        </li>
                        <li>Jefe de Estudios
                            <ul>
                                <li><xsl:value-of select="ite/jefe_estudios/nombre"/></li>
                                <li><xsl:value-of select="ite/director/edificio"/></li>
                                <li><xsl:value-of select="ite/jefe_estudios/despacho"/></li>
                            </ul>
                        </li>
                    </ol>
                </div>
                <div class="courses">
                    <h3>Cursos</h3>                
                    <table border="1">
                        <tr>
                            <th>ID</th>
                            <th>Ciclo</th>
                            <th>Grado</th>
                            <th>Decreto</th>
                        </tr>
                        <xsl:for-each select="ite/ciclos/ciclo">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="@grado"/></td>
                                <td><xsl:value-of select="@año"/></td>
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
                            <input type="submit" value="Enviar"/>
                    </fieldset> 
                </form>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>