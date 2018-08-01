
    
	    function dynamicStyle(){
	    	tabDecoration();
	    	reportProgressIndicator();
	    }
	    
	    function removeStyleRule(ruleName){
	    	var a = true;
	    	while(a == true){
	    		a = false;
	    		for(i = 0; i < document.styleSheets.length; i++){
	    			
	    			for(n= 0; n < document.styleSheets[i].cssRules.length; n++){
	    				if(document.styleSheets[i].cssRules[n].cssText.includes(ruleName)){
	    					a = true;
	    					document.styleSheets[i].deleteRule(n);
	    				}
	    			}	
	    		}
	    	}
	    }

	    function addStyleRule(selector,styleClass,ruleName,property){
	    	var index = document.styleSheets.length - 1;
	    	document.styleSheets[index].insertRule (selector + styleClass+' {'+ruleName+': '+property+'}',document.styleSheets[index].cssRules.length);
	    }
    
	    function reportProgressIndicator(){
	    	
	    	if(window.location.pathname.indexOf('00O') >= 0){

			    addStyleRule("","h2","margin-top","0px");
			    addStyleRule("","h2","vertical-align", "top");
			    addStyleRule("","h2","font-size", "91%");
			    addStyleRule("","h2","font-family","inherit");
			    
			    addStyleRule("",".bPageTitle h1, .bPageTitle h2","display","inline");
			    addStyleRule("",".bPageTitle .ptBody .pageType","font-family","'Verdana','Geneva',san-serif");
			    addStyleRule("",".bPageTitle .ptBody .pageType","font-weight","700");
			    addStyleRule("",".bPageTitle .ptBody .pageType","font-size","109%");
			    //addStyleRule("",".bPageTitle h1, .bPageTitle h2","display","none");
			    addStyleRule("",".pageDescription","color","#CBD0D2");
			    addStyleRule("",".blank","display","none");
			    addStyleRule("",".ptBreadcrumb","display","none");		    	
	    	}
	    }
    
	    function currentTab(selectedTab){
	
	    	document.getElementById('t-'+selectedTab).style.background = '#2b4b79';
	    	document.getElementById('t-'+selectedTab).style.color = '#FFFFFF';
	    }

	    function tabDecoration(){
	    	if(window.location.pathname.indexOf('Home') >= 0){
	    		currentTab('Home');
	    	}
	    	if(window.location.pathname.indexOf('Contact') >= 0 || window.location.pathname.indexOf('/003') >= 0){
	    		currentTab('Contact');
	    	}
	    	if(window.location.pathname.indexOf('Ticket') >= 0 || window.location.pathname.indexOf('/500') >= 0){
	    		currentTab('Ticket');
	    	}
	    	if(window.location.pathname.indexOf('Feature') >= 0){
	    			currentTab('FeatureRequests');
	    	}
	    	if(window.location.pathname.indexOf('Articles') >= 0){
	    		currentTab('KnowledgeBase');
	    	}
	    	if(window.location.pathname.indexOf('00O') >= 0){
	    		currentTab('Report');
	    	}
	    	if(window.location.pathname.indexOf('StateEDI') >= 0){
	    		currentTab('Respond');
	    	}
	    	if(window.location.pathname.indexOf('IMC') >= 0){
	    		currentTab('MyPerform');
	    	}
	    	if(window.location.pathname.indexOf('ideaL') >= 0){
	    		currentTab('RoundTable');
	    	}
	    }
    
        function spanOnHover(ele) {
            ele.setAttribute("style","color: #CCCCCC;text-decoration: underline;cursor: pointer;");
        }
        
        function spanOnHoverOut(ele) {
            ele.setAttribute("style","color: #1865A3;text-decoration: none;");
        }
    
