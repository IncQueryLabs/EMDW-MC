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
