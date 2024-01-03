package com.oopsw.model;

public class TeamsVO {
	private String teamName;
	private String teamLogo;
	private String foundYear;
	private String hometown;
	private String ground;
	private String teamNickname;
	private int eplWins;
	private int facupWins;
	private int leaguecupWins;
	private int champsWins;
	private int europaWins;
	
	public TeamsVO(){}
	public TeamsVO(String teamName, String teamLogo, String foundYear, String hometown,
			String ground, String teamNickname, int eplWins, int facupWins, int leaguecupWins, int champsWins,
			int europaWins) {
		super();
		this.teamName = teamName;
		this.teamLogo = teamLogo;
		this.foundYear = foundYear;
		this.hometown = hometown;
		this.ground = ground;
		this.teamNickname = teamNickname;
		this.eplWins = eplWins;
		this.facupWins = facupWins;
		this.leaguecupWins = leaguecupWins;
		this.champsWins = champsWins;
		this.europaWins = europaWins;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamLogo() {
		return teamLogo;
	}
	public void setTeamLogo(String teamLogo) {
		this.teamLogo = teamLogo;
	}
	public String getFoundYear() {
		return foundYear;
	}
	public void setFoundYear(String foundYear) {
		this.foundYear = foundYear;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getTeamNickname() {
		return teamNickname;
	}
	public void setTeamNickname(String teamNickname) {
		this.teamNickname = teamNickname;
	}
	public int getEplWins() {
		return eplWins;
	}
	public void setEplWins(int eplWins) {
		this.eplWins = eplWins;
	}
	public int getFacupWins() {
		return facupWins;
	}
	public void setFacupWins(int facupWins) {
		this.facupWins = facupWins;
	}
	public int getLeaguecupWins() {
		return leaguecupWins;
	}
	public void setLeaguecupWins(int leaguecupWins) {
		this.leaguecupWins = leaguecupWins;
	}
	public int getChampsWins() {
		return champsWins;
	}
	public void setChampsWins(int champsWins) {
		this.champsWins = champsWins;
	}
	public int getEuropaWins() {
		return europaWins;
	}
	public void setEuropaWins(int europaWins) {
		this.europaWins = europaWins;
	}
	@Override
	public String toString() {
		return "teamName=" + teamName + ", teamLogo=" + teamLogo
				+ ", foundYear=" + foundYear + ", hometown=" + hometown + ", ground=" + ground + ", teamNickname="
				+ teamNickname + ", eplWins=" + eplWins + ", facupWins=" + facupWins + ", leaguecupWins="
				+ leaguecupWins + ", champsWins=" + champsWins + ", europaWins=" + europaWins;
	}
	
	
	
	
	
}
