# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="libretro implementation of Mednafen PCE Fast. (This one only emulates a SuperGrafx TG-16)"
HOMEPAGE="https://github.com/libretro/beetle-supergrafx-libretro"
SRC_URI=""

EGIT_REPO_URI="https://github.com/libretro/beetle-supergrafx-libretro.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack() {
	git-r3_fetch https://github.com/libretro/libretro-super.git HEAD
	git-r3_checkout https://github.com/libretro/libretro-super.git \
		"${WORKDIR}"/infos
	git-r3_fetch
	git-r3_checkout
}

src_install() {
	insinto /usr/$(get_libdir)/libretro
	doins "${S}"/mednafen_supergrafx_libretro.so
	insinto /usr/share/libretro/info/
	doins "${WORKDIR}"/infos/dist/info/mednafen_supergrafx_libretro.info
}
