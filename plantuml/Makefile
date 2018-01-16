# Copyright 2017 chaishushan{AT}gmai.com. All rights reserved.
# Use of this source code is governed by a Apache license
# that can be found in the LICENSE file.

default:
	cat test.uml | docker run --rm -i chai2010/plantuml -Tsvg > test.svg
	cat test.uml | docker run --rm -i chai2010/plantuml -Tpng > test.png

clean:
