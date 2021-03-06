# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/${PN//-libretro}"
LIBRETRO_COMMIT_SHA="077f38e2702c4a704259c9026cf584a423d55982"
inherit libretro-core

DESCRIPTION="Snes9x 2002. Port of SNES9x 1.39 for libretro (previously PocketSNES)"
HOMEPAGE="https://github.com/libretro/snes9x2002"
KEYWORDS="~amd64 ~x86"

LICENSE="PS"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"
