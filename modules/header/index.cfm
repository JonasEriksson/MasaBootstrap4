<cfsilent>
	<cfif request.muraFrontEndRequest>
		<cfset objectparams.title=Mura.content('title')>
		<cfset objectparams.summary=Mura.content('summary')>
	<cfelse>
		<cfparam name="objectparams.title" default="#Mura.content('title')#">
		<cfparam name="objectparams.summary" default="#Mura.content('summary')#">
	</cfif>
</cfsilent>

<cfoutput>
 <header>
	<div class="container">
		<h1><div id="mura-editable-attribute-title" class="mura-editable-attribute inline" data-type="text" data-attribute="title">#esapiEncode('html',objectparams.title)#</div></h1>
		<div class="summary mura-editable-attribute inline" id="mura-editable-attribute-summary" data-type="htmlEditor" data-attribute="summary">#objectparams.summary#</div>
	</div>
</header>
<cfif Mura.content('subtype') neq "Blog Post"><!---These are included in the page_blogpost content type template--->
<!--- Breadcrumbs --->
<div class="container">
	<div class="row">
		<div class="col py-3">
			<nav aria-label="breadcrumb">#Mura.dspCrumbListLinks(class="")#</nav>
		</div>
	</div>
</div>
<!--- /Breadcrumbs --->
</cfif>

<cfset commentCount = Val(Mura.content().getStats().getComments())>
<cfset itCategories = Mura.content().getCategoriesIterator()>
<cfif
	IsDate(Mura.setDynamicContent(Mura.content('releasedate')))
	or Len(Mura.setDynamicContent(Mura.content('credits')))
	or ListLen(Mura.content().getTags())
	or itCategories.hasNext()
	or commentCount>
	<div class="row align-items-center py-3 border-top border-bottom">
		<div class="col-auto">
			<!--- Credits --->
				<cfif Len(Mura.setDynamicContent(Mura.content('credits')))>
					<h6 class="text-uppercase credits">
						<i class="fa fa-user" aria-hidden="true"></i> #esapiEncode('html', Mura.setDynamicContent(Mura.content('credits')))#
					</h6>
				</cfif>
			<!--- /Credits --->
			<!--- Content Release Date --->
				<cfif IsDate(Mura.setDynamicContent(Mura.content('releasedate')))>
					<p class="text-muted my-0">
						<i class="fa fa-clock-o" aria-hidden="true"></i> #LSDateFormat(Mura.setDynamicContent(Mura.content('releasedate')))#
					</p>
				</cfif>
			<!--- /Content Release Date --->
		</div>
		<div class="col-auto ml-auto">
			<!--- Categories --->	
			<cfif itCategories.hasNext()>
			<div>
				<ul class="list-inline float-md-right">
					<cfloop condition="itCategories.hasNext()">
					<cfset categoryItem = itCategories.next()>
					<li class="list-inline-item badge badge-dark category">
	<!--- 					<i class="fa fa-folder-open" aria-hidden="true"></i> --->
							#HTMLEditFormat(categoryItem.getName())#
					</li>
					</cfloop>
				</ul>
			</div>
			</cfif>
			<!--- /Categories --->
			<!--- Tags --->
			<cfif ListLen(Mura.content().getTags())>
			<div>
				<ul class="tags list-inline float-md-right">
					<cfloop from="1" to="#ListLen(Mura.content().getTags())#" index="t">
					<li class="list-inline-item badge badge-light tag">
						#esapiEncode('html', trim(ListGetAt(Mura.content().getTags(), t)))#<!--- <cfif t neq ListLen(Mura.content().getTags())>, </cfif> --->
					</li>
					</cfloop>
				</ul>
			</div>
			</cfif>
			<!--- /Tags --->
			<!--- Comments --->
			<cfif commentCount gt 0>
			<div>
				<ul class="list-inline">
					<li class="list-inline-item comments">
						<i class="fa fa-comments" aria-hidden="true"></i> #commentCount# Comment<cfif commentCount gt 1>s</cfif>
					</li>
				</ul>
			</div>
			</cfif>
			<!--- /Comments --->
		</div>
	</div>
</cfif>
</cfoutput>
