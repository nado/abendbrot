# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro

DESCRIPTION="Collection of slang shaders."
HOMEPAGE="https://github.com/libretro/slang-shaders"
SRC_URI="https://github.com/libretro/slang-shaders/archive/1a571177de163e12ab022c178b50d76f2d33d5c2.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/slang-shaders-1a571177de163e12ab022c178b50d76f2d33d5c2"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="git://github.com/libretro/slang-shaders.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dodir "${LIBRETRO_DATA_DIR}"/"${PN}"
	# Remove unnecessary git files
	rm -r .git
	cp -R "${S}"/* "${D}${LIBRETRO_DATA_DIR}"/"${PN}"/
}