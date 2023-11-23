# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Open-source wallpaper changer for Linux"
HOMEPAGE="https://github.com/varietywalls/variety"
SRC_URI="https://github.com/varietywalls/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="fortune"

DEPEND+="
	>=dev-python/python-distutils-extra-2.18[${PYTHON_USEDEP}]
"

RDEPEND+="
	fortune? (
		games-misc/fortune-mod
	)
	dev-python/dbus-python[${PYTHON_USEDEP}]
	x11-libs/gtk+:3[introspection]
	media-libs/gexiv2[introspection]
	x11-libs/libnotify[introspection]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP},cairo]
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/httplib2[${PYTHON_USEDEP}]
	media-gfx/imagemagick
	dev-libs/libappindicator
"

python_compile() {
   esetup.py install --root="${D}"/usr
}
