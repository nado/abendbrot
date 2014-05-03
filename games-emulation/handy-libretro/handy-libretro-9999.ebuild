# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="libretro implementation of Handy. (Atari Lynx)"
HOMEPAGE="https://github.com/libretro/libretro-handy"
SRC_URI=""

EGIT_REPO_URI="https://github.com/libretro/libretro-handy.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-libs/zlib"
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
	doins "${S}"/handy_libretro.so
	doins "${WORKDIR}"/infos/dist/info/handy_libretro.info
}