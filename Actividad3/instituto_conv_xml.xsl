<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <instituto>
            <nombre><xsl:value-of select="ite/@nombre"/></nombre>
            <web><xsl:value-of select="ite/@web"/></web>
            <empresa_matriz><xsl:value-of select="ite/empresa"/></empresa_matriz>
            <telefono_contacto><xsl:value-of select="ite/telefono"/></telefono_contacto>
            <claustro_profesores>
                <xsl:for-each select="ite/profesores/profesor"> 
                    <profesor>
                        <xsl:attribute name="id_profesor">
                            <xsl:value-of select="id"/>
                        </xsl:attribute>
                        <nombre_profesor>
                            <xsl:value-of select="nombre"/>
                        </nombre_profesor>
                    </profesor>
                </xsl:for-each>
            </claustro_profesores>
            <equipo_directivo>
                <nombre>
                    <xsl:attribute name="cargo">Directora</xsl:attribute>
                    <xsl:attribute name="direccion">
                        <xsl:value-of select="ite/director/despacho"/>
                    </xsl:attribute>
                    <xsl:value-of select="ite/director/nombre"/>
                </nombre>
                <nombre>
                    <xsl:attribute name="cargo">Jefe de Estudios</xsl:attribute>
                    <xsl:attribute name="direccion">
                        <xsl:value-of select="ite/jefe_estudios/despacho"/>
                    </xsl:attribute>
                    <xsl:value-of select="ite/jefe_estudios/nombre"/>
                </nombre>
            </equipo_directivo>
            <ciclos_formativos>
                <xsl:for-each select="ite/ciclos/ciclo">
                    <ciclo_fp>
                        <xsl:attribute name="id_ciclo">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <nombre_ciclo><xsl:value-of select="nombre"/></nombre_ciclo>
                        <tipo_grado><xsl:value-of select="grado"/></tipo_grado>
                        <año_decreto><xsl:value-of select="decretoTitulo/@año"/></año_decreto>
                    </ciclo_fp>
                </xsl:for-each>
            </ciclos_formativos>   
        </instituto>
    </xsl:template>
</xsl:stylesheet>