@routing @bearing
Feature: Compass bearing
	
	@northwest
	Scenario: Bearing when going northwest
		Given the node map
		 | b |   |
		 |   | a |

		And the ways
		 | nodes |
		 | ab    |

		When I route I should get
		 | from | to | route | compass | bearing |
		 | a    | b  | ab    | NW      | 45      |

	@west
	Scenario: Bearing when going west
		Given the node map
		 | b | a |

		And the ways
		 | nodes |
		 | ab    |

		When I route I should get
		 | from | to | route | compass | bearing |
		 | a    | b  | ab    | W       | 90      |

	Scenario: Bearing af 45 degree intervals
		Given the node map
		 | b | a | h |
		 | c | x | g |
		 | d | e | f |

		And the ways
		 | nodes |
		 | xa    |
		 | xb    |
		 | xc    |
		 | xd    |
		 | xe    |
		 | xf    |
		 | xg    |
		 | xh    |

		When I route I should get
		 | from | to | route | compass | bearing |
		 | x    | a  | xa    | N       | 0       |
		 | x    | b  | xb    | NW      | 45      |
		 | x    | c  | xc    | W       | 90      |
		 | x    | d  | xd    | SW      | 135     |
		 | x    | e  | xe    | S       | 180     |
		 | x    | f  | xf    | SE      | 225     |
		 | x    | g  | xg    | E       | 270     |
		 | x    | h  | xh    | NE      | 315     |

	Scenario: Bearing in a roundabout
		Given the node map
		 |   | d | c |   |
		 | e |   |   | b |
		 | f |   |   | a |
		 |   | g | h |   |

		And the ways
		 | nodes | oneway |
		 | ab    | yes    |
		 | bc    | yes    |
		 | cd    | yes    |
		 | de    | yes    |
		 | ef    | yes    |
		 | fg    | yes    |
		 | gh    | yes    |
		 | ha    | yes    |

		When I route I should get
		 | from | to | route                | compass          | bearing                 |
		 | c    | b  | cd,de,ef,fg,gh,ha,ab | W,SW,S,SE,E,NE,N | 90,135,180,225,270,0,45 |
		 | g    | f  | gh,ha,ab,bc,cd,de,ef | E,NE,N,NW,W,SW,S | 270,315,0,45,90,180,225 |

	Scenario: Bearing should stay constant when zig-zagging
		Given the node map
		 | b | d | f | h |
		 | a | c | e | g |

		And the ways
		 | nodes |
		 | ab    |
		 | bc    |
		 | cd    |
		 | de    |
		 | ef    |
		 | fg    |
		 | gh    |

		When I route I should get
		 | from | to | route                | compass          | bearing             |
		 | a    | h  | ab,bc,cd,de,ef,fg,gh | N,SE,N,SE,N,SE,N | 0,225,0,225,0,225,0 |
