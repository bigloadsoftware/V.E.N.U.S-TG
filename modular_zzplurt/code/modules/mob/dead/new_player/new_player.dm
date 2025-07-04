/mob/dead/new_player/Topic(href, list/href_list)
	//maturity check
	if(!client?.maturity_prompt_whitelist && !SSmaturity_guard.age_check(src))
		return

	//discord check
	var/vibe_check = SSdiscord?.check_login(src)
	if(isnull(vibe_check))
		to_chat(usr, span_notice("The server is still starting up. Please wait... "))
		return
	if(href_list["observe"] || href_list["toggle_ready"] || href_list["late_join"])
		if(!vibe_check)
			to_chat(usr, span_warning("You must link your discord account to your ckey in order to join the game. Join our <a style=\"color: #ff00ff;\" href=\"[CONFIG_GET(string/discord_link)]\">discord</a> and use open a Verification Request Ticket. It won't take you more than two minutes :)<br>Remember that to maintain in-game verification you MUST remain in the discord.<br>Ahelp or ask staff in the discord if this is an error."))
			return
	. = ..()
