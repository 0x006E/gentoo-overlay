# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit toolchain-funcs

DESCRIPTION="Converts Apple DMG files to standard HFS+ images"
HOMEPAGE="http://vu1tur.eu.org/tools"
SRC_URI="http://vu1tur.eu.org/tools/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE=""

RDEPEND="app-arch/bzip2
	sys-libs/zlib"
DEPEND="${RDEPEND}
	sys-apps/sed"

src_prepare() {
	eapply_user
	sed -i -e 's:-s:$(LDFLAGS):g' Makefile || die "sed failed"
}

src_compile() {
	tc-export CC
	emake CFLAGS="${CFLAGS}" dmg2img
}

src_install() {
	dobin dmg2img
	dodoc README
}
