#require 'saclient/cloud/api'
require './lib/saclient/cloud/api.rb'
require 'JSON'

api = Saclient::Cloud::API.authorize(ARGV[0], ARGV[1])

server = api.server.create
server.name = 'saclient.rb'
server.plan = api.product.server.get_by_spec(1, 1)
server.save
servers = api.server.with_name_like('saclient.rb').find
printf "%s\n", servers[0].name
server.destroy


# printf "%s\n", Saclient::Cloud::Enums::EServerInstanceStatus.down
# printf "%s\n", Saclient::Cloud::Enums::EServerInstanceStatus.compare("aaa", "down").nil?
# printf "%s\n", Saclient::Cloud::Enums::EServerInstanceStatus.compare("up", "down")
# printf "%s\n", Saclient::Cloud::Enums::EServerInstanceStatus.compare("down", "up")


# # 停止中のサーバに接続されているディスクを一覧
# servers = api.server.with_instance_status("down").find
# for server in servers
#   next if server.tags.empty?
#   puts ""
#   printf "server [%s] %s at %s\n", server.id, server.instance.status, server.instance.status_changed_at.to_s
#   printf "    tags: %s\n", server.tags.join(', ')
#   #puts JSON.pretty_unparse(server.dump())
#   for iface in server.ifaces
#     printf "    iface [%s] %s %s\n", iface.id, iface.mac_address, iface.ip_address || iface.user_ip_address
#   end
#   disks = server.find_disks # same as: disks = api.disk.with_server_id(server.id).find
#   for disk in disks
#     printf "    disk [%s] %s\n", disk.id, disk.name
#   end
# end


# # 特定のタグを持つサーバの説明に現在時刻を追記
# servers = api.server.with_tag("abc").find
# for server in servers
#   printf "server [%s] %s\n", server.id, server.name
#   server.description += "\n" + Time.now.strftime("%Y/%m/%d %H:%M:%S")
#   server.save
#   printf "%s\n\n", server.description
# end


# icons = api.icon.with_name_like('cent').limit(1).find
# abort 'icon not found' if icons.empty?
# icon = icons[0]
# printf "icon [%s] %s\n\n", icon.id, icon.name
# 
# servers = api.server.with_name_like('cent').find
# for server in servers
#     printf "server [%s] %s\n", server.id, server.name
#     server.icon = nil
#     server.save
#     printf "  changed icon to nothing: %s\n", (server.icon.nil? ? 'OK' : 'NG')
#     server.icon = icon
#     server.save
#     printf "  changed icon to: [%s] %s\n\n", server.icon.id, server.icon.name
# end


# plan_from = api.product.server.get_by_spec(2, 4)
# printf "plan from: [%s] %dcore %dGB\n", plan_from.id, plan_from.cpu, plan_from.memory_gib
# plan_to   = api.product.server.get_by_spec(4, 8)
# printf "plan to:   [%s] %dcore %dGB\n", plan_to.id, plan_to.cpu, plan_to.memory_gib
# printf "\n"
# 
# servers = api.server.with_plan(plan_from).find()
# for server in servers
#     printf "server [%s] %dcore %dGB '%s'\n", server.id, server.plan.cpu, server.plan.memory_gib, server.name
#     server.change_plan(plan_to)
#     printf "    -> [%s] %dcore %dGB\n\n", server.id, server.plan.cpu, server.plan.memory_gib
# end

