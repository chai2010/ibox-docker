# Copyright 2017 <chaishushan{AT}gmail.com>. All rights reserved.
# Use of this source code is governed by a Apache
# license that can be found in the LICENSE file.

default:
	docker pull chai2010/ibox
	docker pull chai2010/ibox:plantuml
	docker pull chai2010/ibox:ditaa

clean:
	-docker image prune -f 1>/dev/null 2>&1
