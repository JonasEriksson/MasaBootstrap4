<cfoutput>
<!--- <div class="jumbotron text-center mb-0" style="color: white; background-image: url(#m.content().getImageURL(size='carouselimage')#); background-size: cover; background-repeat: no-repeat; background-attachment: scroll;">
	<h1 class="display-4" style="padding: 15px; display: inline-block; text-transform: uppercase; background-color: rgba(0, 0, 0, 0.52);">#m.renderEditableAttribute(attribute='title')#</h1>
	<cfset commentCount = Val($.content().getStats().getComments())>
	<cfset itCategories = $.content().getCategoriesIterator()>
	<cfif
		IsDate($.setDynamicContent($.content('releasedate')))
		or Len($.setDynamicContent($.content('credits')))
		or ListLen($.content().getTags())
		or itCategories.hasNext()
		or commentCount>
		<ul class="list-inline">

			<!--- Content Release Date --->
				<cfif IsDate($.setDynamicContent($.content('releasedate')))>
					<li class="list-inline-item">
						<i class="fa fa-clock-o" aria-hidden="true"></i> #LSDateFormat($.setDynamicContent($.content('releasedate')))#
					</span>
				</cfif>
			<!--- /Content Release Date --->

			<!--- Comments --->
				<cfif commentCount gt 0>
					<li class="list-inline-item">
						<i class="fa fa-comments" aria-hidden="true"></i> #commentCount# Comment<cfif commentCount gt 1>s</cfif>
					</li>
				</cfif>
			<!--- /Comments --->

			<!--- Tags --->
				<cfif ListLen($.content().getTags())>
					<li class="list-inline-item">
						<i class="fa fa-tags" aria-hidden="true"></i>
						<cfloop from="1" to="#ListLen($.content().getTags())#" index="t">
						#esapiEncode('html', trim(ListGetAt($.content().getTags(), t)))#<cfif t neq ListLen($.content().getTags())>, </cfif>
						</cfloop>
					</li>
				</cfif>
			<!--- /Tags --->

			<!--- Categories --->
				<cfif itCategories.hasNext()>
					<li class="list-inline-item">
						<i class="fa fa-folder-open" aria-hidden="true"></i>
						<cfloop condition="itCategories.hasNext()">
							<cfset categoryItem = itCategories.next()>
							#HTMLEditFormat(categoryItem.getName())#</a><cfif itCategories.hasNext()>, </cfif>
						</cfloop>
					</li>
				</cfif>
			<!--- /Categories --->

			<!--- Credits --->
				<cfif Len($.setDynamicContent($.content('credits')))>
					<li class="list-inline-item">
						<i class="fa fa-user" aria-hidden="true"></i> #esapiEncode('html', $.setDynamicContent($.content('credits')))#
					</li>
				</cfif>
			<!--- /Credits --->
		</ul>
	</cfif>
</div> --->
</cfoutput>
