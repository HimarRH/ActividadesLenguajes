<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <instituto>
            <nombre><xsl:value-of select="ite/@nombre"/></nombre>
            <web><xsl:value-of select="ite/@web"/></web>
            <empresa><xsl:value-of select="ite/empresa"/></empresa>
            <telefono><xsl:value-of select="ite/telefono"/></telefono>
            <profesores>
                <xsl:for-each select="ite/profesores/profesor"> 
                    <profesor>
                        <xsl:attribute name="id">
                            <xsl:value-of select="id"/>
                        </xsl:attribute>
                        <nombre>
                            <xsl:value-of select="nombre"/>
                        </nombre>
                    </profesor>
                </xsl:for-each>
            </profesores>
            <direccion>
                <nombre>
                    <xsl:attribute name="puesto">Directora</xsl:attribute>
                    <xsl:attribute name="direccion">
                        <xsl:value-of select="ite/director/despacho"/>
                    </xsl:attribute>
                    <xsl:value-of select="ite/director/nombre"/>
                </nombre>
                <nombre>
                    <xsl:attribute name="puesto">Jefe de Estudios</xsl:attribute>
                    <xsl:attribute name="direccion">
                        <xsl:value-of select="ite/jefe_estudios/despacho"/>
                    </xsl:attribute>
                    <xsl:value-of select="ite/jefe_estudios/nombre"/>
                </nombre>
            </direccion>
            <ciclos>
                <xsl:for-each select="ite/ciclos/ciclo">
                    <ciclo>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="grado">
                            <xsl:value-of select="grado"/>
                        </xsl:attribute>
                        <xsl:attribute name="decreto">
                            <xsl:value-of select="decretoTitulo/@año"/>
                        </xsl:attribute>
                        <nombre_ciclo><xsl:value-of select="nombre"/></nombre_ciclo>
                    </ciclo>
                </xsl:for-each>
            </ciclos>   
        </instituto>
    </xsl:template>
</xsl:stylesheet>