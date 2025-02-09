  package com.company.security;
  
  
  @Log4j
  public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
  
  	@Override
  	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
  			Authentication auth) throws IOException, ServletException {
  		
  		log.warn("Login Success");
  		
  		List<String> roleNames = new ArrayList<>();
  		
  		auth.getAuthorities().forEach(authority -> {
  			
  			roleNames.add(authority.getAuthority());
  		});
  		
  		log.warn("ROLE NAMES: "+roleNames);
  		
  		if (roleNames.contains("ROLE_ADMIN")) {
  			
  			response.sendRedirect("/sample/admin");
  			return;
  		}
  		if (roleNames.contains("ROLE_MEMBER")) {
  			
  			response.sendRedirect("/sample/member");
  			return;
  		}
  		
  		response.sendRedirect("/");
  	}
  
  }