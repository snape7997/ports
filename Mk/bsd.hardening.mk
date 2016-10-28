# $FreeBSD$
#
# HardenedBSD-related ports options

.if !defined(__BSD_PORT_HARDENING_MK)
__BSD_PORT_HARDENING_MK=1

HARDENING_NOPIE_PORTS?=		# can pass exceptions from make.conf
HARDENING_NORELRO_PORTS?=	# can pass exceptions from make.conf

.include "bsd.hardening.exceptions.mk"

.if defined(NO_PORTS_HARDENING)
NOPIE_PORTS=	yes
NORELRO_PORTS=	yes
.endif

.if "${HARDENING_NOPIE_PORTS:M${PORTNAME}}" != ""
NOPIE_PORTS=	yes
.endif

.if "${HARDENING_NORELRO_PORTS:M${PORTNAME}}" != ""
NORELRO_PORTS=	yes
.endif

####################################################
### Position-Idependent Executable (PIE) support ###
####################################################

PIE_DESC=		Build as PIE
PIE_USES=		pie

# Do not enable PIE for libraries or kernel module ports. However,
# provide a way for still enabling PIE if desired by the port's
# maintainer by allowing them to define EXPLICIT_PIE.
#
# It's possible that keying off lib* as the port's name could
# introduce false positives. Hence even more reason to have
# EXPLICIT_PIE.
.if defined(PORTNAME)
.if !defined(EXPLICIT_PIE)
.if ${PORTNAME:Mlib*} || ${PORTNAME:M*kmod*} || \
	(defined(PKGNAMESUFFIX) && (${PKGNAMESUFFIX:Mlib*}))
NOPIE_PORTS=	yes
.endif
.endif
.endif

.if defined(USES)
.for _USES in ${USES}
.if ${_USES} == kmod || ${_USES} == fortran
NOPIE_PORTS=	yes
.endif
.endfor
.endif

.if !defined(NOPIE_PORTS)
OPTIONS_DEFINE+=	PIE
OPTIONS_DEFAULT+=	PIE
.endif

################################
### RELRO + BIND_NOW support ###
################################

RELRO_DESC=		Build with RELRO + BIND_NOW
RELRO_USES=		relro

# Same reasoning here with RELRO as with PIE.
.if defined(PORTNAME)
.if !defined(EXPLICIT_RELRO)
.if ${PORTNAME:Mlib*} || ${PORTNAME:M*kmod*} || \
	(defined(PKGNAMESUFFIX) && (${PKGNAMESUFFIX:Mlib*}))
NORELRO_PORTS=	yes
.endif
.endif
.endif

.if defined(USES)
.for _USES in ${USES}
.if ${_USES} == kmod || ${_USES} == fortran
NORELRO_PORTS=	yes
.endif
.endfor
.endif

.if defined(CATEGORIES)
.for _CATEGORY in ${CATEGORIES}
.if ${_CATEGORY} == x11-drivers
NORELRO_PORTS=	yes
.endif
.endfor
.endif

.if !defined(NORELRO_PORTS)
OPTIONS_DEFINE+=	RELRO
OPTIONS_DEFAULT+=	RELRO
.endif
.endif # !__BSD_PORT_HARDENING_MK