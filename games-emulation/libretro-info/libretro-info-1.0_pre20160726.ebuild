# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro

DESCRIPTION="Libretro info files required for libretro cores"
HOMEPAGE="https://github.com/libretro/libretro-super"
SRC_URI="https://github.com/libretro/libretro-super/archive/fc2eef2c237d2022deb28e1d0be5e982f1e9a529.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/libretro-super-fc2eef2c237d2022deb28e1d0be5e982f1e9a529"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/libretro/libretro-super.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86 arm"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_pretend() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		elog ""
		elog "If this ebuild complains about file collisions, then emerge again with:"
		elog "FEATURES=\"-collision-detect -protect-owned\""
		elog "This is caused by the info file move from individual ebuilds to this one."
		elog ""
	fi
}

src_compile() {
	:
}

src_install() {
	insinto "${LIBRETRO_DATA_DIR}"/info
	doins dist/info/*.info
}