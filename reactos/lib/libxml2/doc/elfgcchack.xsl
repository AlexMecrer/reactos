<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                version="1.0">
  <xsl:output method="text" encoding="ISO-8859-1"/>

  <xsl:template match="/">
    <xsl:text>/*
 * elfgcchack.h: hack by Arjan van de Ven &lt;arjanv@redhat.com&gt; to speed
 *               up the code when using gcc for call within the library.
 *
 * Based on the analysis http://people.redhat.com/drepper/dsohowto.pdf
 * from Ulrich drepper. Rewritten to be generated from the XML description
 * file for libxml2 API
 * autogenerated with xsltproc doc/elfgcchack.xsl doc/libxml2-api.xml
 */

#ifdef IN_LIBXML
#ifdef __GNUC__
#ifdef PIC
#ifdef linux
#if (__GNUC__ == 3 &amp;&amp; __GNUC_MINOR__ >= 3) || (__GNUC__ > 3)

#include "libxml/c14n.h"
#include "libxml/catalog.h"
#include "libxml/chvalid.h"
#include "libxml/debugXML.h"
#include "libxml/dict.h"
#include "libxml/DOCBparser.h"
#include "libxml/encoding.h"
#include "libxml/entities.h"
#include "libxml/globals.h"
#include "libxml/hash.h"
#include "libxml/HTMLparser.h"
#include "libxml/HTMLtree.h"
#include "libxml/list.h"
#include "libxml/nanoftp.h"
#include "libxml/nanohttp.h"
#include "libxml/parser.h"
#include "libxml/parserInternals.h"
#include "libxml/pattern.h"
#include "libxml/relaxng.h"
#include "libxml/SAX2.h"
#include "libxml/SAX.h"
#include "libxml/schemasInternals.h"
#include "libxml/threads.h"
#include "libxml/tree.h"
#include "libxml/uri.h"
#include "libxml/valid.h"
#include "libxml/xinclude.h"
#include "libxml/xlink.h"
#include "libxml/xmlautomata.h"
#include "libxml/xmlerror.h"
#include "libxml/xmlexports.h"
#include "libxml/xmlIO.h"
#include "libxml/xmlmemory.h"
#include "libxml/xmlreader.h"
#include "libxml/xmlregexp.h"
#include "libxml/xmlsave.h"
#include "libxml/xmlschemas.h"
#include "libxml/xmlschemastypes.h"
#include "libxml/xmlstring.h"
#include "libxml/xmlunicode.h"
#include "libxml/xmlversion.h"
#include "libxml/xmlwriter.h"
#include "libxml/xpath.h"
#include "libxml/xpathInternals.h"
#include "libxml/xpointer.h"
#include "libxml/xmlmodule.h"

/* special hot spot not exported ones */

#ifdef bottom_globals
#undef __xmlGenericError
extern __typeof (__xmlGenericError) __xmlGenericError __attribute((alias("__xmlGenericError__internal_alias")));
#else
#ifndef __xmlGenericError
extern __typeof (__xmlGenericError) __xmlGenericError__internal_alias __attribute((visibility("hidden")));
#define __xmlGenericError __xmlGenericError__internal_alias
#endif
#endif

#ifdef bottom_globals
#undef __xmlGenericErrorContext
extern __typeof (__xmlGenericErrorContext) __xmlGenericErrorContext __attribute((alias("__xmlGenericErrorContext__internal_alias")));
#else
#ifndef __xmlGenericErrorContext
extern __typeof (__xmlGenericErrorContext) __xmlGenericErrorContext__internal_alias __attribute((visibility("hidden")));
#define __xmlGenericErrorContext __xmlGenericErrorContext__internal_alias
#endif
#endif

/* list generated from libxml2-api.xml */
</xsl:text>
    <xsl:apply-templates select="/api/symbols/function"/>
    <xsl:text>
#endif
#endif
#endif
#endif
#endif

</xsl:text>
  </xsl:template>

  <xsl:template match="function">
    <xsl:variable name="str" select="string(@name)"/>
    <xsl:if test="starts-with(@name, 'xml') or starts-with(@name, 'html') or contains(@name, 'Push') or contains(@name, 'Pop')">
      <xsl:variable name="alias" select="concat($str, '__internal_alias')"/>
      <xsl:apply-templates select="cond"/>
      <xsl:text>#ifdef bottom_</xsl:text>
      <xsl:value-of select="string(@module)"/>
      <xsl:text>
#undef </xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text>
extern __typeof (</xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text>) </xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text> __attribute((alias("</xsl:text>
      <xsl:value-of select="$alias"/>
      <xsl:text>")));
#else
#ifndef </xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text>
</xsl:text>
      <xsl:text>extern __typeof (</xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text>) </xsl:text>
      <xsl:value-of select="$alias"/>
      <xsl:text> __attribute((visibility("hidden")));
</xsl:text>
      <xsl:text>#define </xsl:text>
      <xsl:value-of select="$str"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$alias"/>
      <xsl:text>
#endif
#endif
</xsl:text>
      <xsl:apply-templates select="cond" mode="end"/>
      <xsl:text>
</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="cond">
    <xsl:text>#if </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="cond" mode="end">
    <xsl:text>#endif
</xsl:text>
  </xsl:template>
</xsl:stylesheet>

