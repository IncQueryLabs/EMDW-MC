package com.incquerylabs.emdw.alf.generator.tests

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AlfGeneratorTest extends AbstractAlfGeneratorTest {
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Addition Expression",
				'''
				class SimpleTest {
					activity test() {
						1 + 2;
					}
				}''', 
				'''
				    1 + 2;
				'''
			],
			#[  "Simple local variable",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
					}
				}''',
				'''
					int x = 1 + 2;
				'''
			],
			#[  "Hexadecimal literal",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 0xAE10;
					}
				}''',
				'''
					int x = 0xAE10;
				'''
			],
			#[  "Underscore literal",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 123_456;
					}
				}''',
				'''
					int x = 123456;
				'''
			],
			#[  "Multiple additions",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
						let y : Integer = 1 + 2;
					}
				}''',
				'''
					int x = 1 + 2;
					int y = 1 + 2;
				'''
			],
			#[  "Chained addition",
			    '''
                class SimpleTest {
                    activity test() {
                    let x : Integer = 1 + 2 + 3 + 4;
                    }
                }
                ''',
			    '''
			     int x = 1 + 2 + 3 + 4;
			    '''
			],
			#[  "Parenthesed addition",
			    '''
                class SimpleTest {
                    activity test() {
                    let x : Integer = (1 * (2 + 3)) + 4;
                    }
                }
                ''',
			    '''
			     int x = 1 * (2 + 3) + 4;
			    '''
			],
			#[  "Local variable reference",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
						let y : Integer = x + 2;
					}
				}''',
				'''
					int x = 1 + 2;
					int y = x + 2;
				'''
			],
			#[  "Increment operation",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        x++;
                    }
                }''',
                '''
                    int x = 1;
                    x++;
                '''
            ],
			#[  "Increment operation (prefix)", //Prefix expressions not supported by current parser
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        ++x;
                    }
                }''',
                '''
                    int x = 1;
                    ++x;
                '''
            ],
			#[  "Decrement operation",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        x--;
                    }
                }''',
                '''
                    int x = 1;
                    x--;
                '''
            ],
			#[  "Decrement operation (prefix)", //Prefix expressions not supported by current parser
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        --x;
                    }
                }''',
                '''
                    int x = 1;
                    --x;
                '''
            ],
			#[  "Left shift",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        let y : Integer = x << 1;
                    }
                }''',
                '''
                    int x = 1;
                    int y = x << 1;
                '''
            ],
			#[  "Right shift",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1;
                        let y : Integer = x >> 1;
                    }
                }''',
                '''
                    int x = 1;
                    int y = x >> 1;
                '''
            ],
			#[  "Shift precedence",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Integer = 1 + (2 >> 3);
                    }
                }''',
                '''
                    int x = 1 + (2 >> 3);
                '''
            ],
			#[  "Comparison <",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 < 2;
                    }
                }''',
                '''
                    bool x = 1 < 2;
                '''
            ],
			#[  "Comparison <=",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 <= 2;
                    }
                }''',
                '''
                    bool x = 1 <= 2;
                '''
            ],
			#[  "Comparison >",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 > 2;
                    }
                }''',
                '''
                    bool x = 1 > 2;
                '''
            ],
			#[  "Comparison >=",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 >= 2;
                    }
                }''',
                '''
                    bool x = 1 >= 2;
                '''
            ],
			#[  "Equality",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 == 2;
                    }
                }''',
                '''
                    bool x = 1 == 2;
                '''
            ],
			#[  "Inequality",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2;
                    }
                }''',
                '''
                    bool x = 1 != 2;
                '''
            ],
			#[  "Logical &",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2 & false;
                    }
                }''',
                '''
                    bool x = 1 != 2 & false;
                '''
            ],
			#[  "Logical ^",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2 ^ false;
                    }
                }''',
                '''
                    bool x = 1 != 2 ^ false;
                '''
            ],
			#[  "Logical |",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2 | false;
                    }
                }''',
                '''
                    bool x = 1 != 2 | false;
                '''
            ],
			#[  "Logical &&",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2 && true;
                    }
                }''',
                '''
                    bool x = 1 != 2 && true;
                '''
            ],
			#[  "Logical ||",
                '''
                class SimpleTest {
                    activity test() {
                        let x : Boolean = 1 != 2 || true;
                    }
                }''',
                '''
                    bool x = 1 != 2 || true;
                '''
            ],
			#[  "Conditional test operation",
                '''
                class SimpleTest {
                    activity test() {
                        let x : String = (1 != 2) ? "test" : "test2";
                    }
                }''',
                '''
                    std::string x = (1 != 2) ? ("test") : ("test2");
                '''
            ],
			#[  "Assignment",
                '''
                class SimpleTest {
                    activity test(out y : Integer) {
                        y = 2;
                    }
                }''',
                '''
                    y = 2;
                '''
            ],
			#[  "String concatenation",
			    '''
				class SimpleTest {
					activity test() {
						let x : String = "1" + "2";
					}
				}''',
				'''
					std::string x = "1" + "2";
				'''
			]
		)
	}

}
