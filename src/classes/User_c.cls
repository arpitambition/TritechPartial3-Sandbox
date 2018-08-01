/*
** Class created for automated processing of user records
** 
** Revision History
** 
** 11/14/2016	KBecker (Katch Consulting)	Initial Creation
*/

public class User_c {
	
	private list <PermissionSet> permissionSets;
	private list <PermissionSetAssignment> permissionSetAssignments = new list<PermissionSetAssignment>();
	private set <string> permissionSetAssigns = new set <string>(); 
	
	public User_c(){
		permissionSets = new list <PermissionSet>([Select Id,Name From PermissionSet where name like '%Bomgar%']);
	}
	
	public void assignBomgarPermissions(list <User> users){
		
		for(User u: users){
			for(PermissionSet ps: permissionSets){
				if(!permissionSetAssigns.contains(string.valueOf(ps.Id)+string.valueOf(u.Id))){
					PermissionSetAssignment psa = new PermissionSetAssignment(PermissionSetId = ps.Id,AssigneeId = u.Id);
					permissionSetAssignments.add(psa);
				}
			}
		}
		insert permissionSetAssignments;		
	}
	
	private void setPermissionSetAssigns(){
		for(PermissionSetAssignment ps: [Select PermissionSetId,AssigneeId From PermissionSetAssignment]){
			permissionSetAssigns.add(string.valueOf(ps.PermissionSetId)+string.valueOf(ps.AssigneeId));
		}
	}
    
}