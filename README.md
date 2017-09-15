# _Word Definer_

#### _A webpage to learn Words_

#### By _**Mark Helt**_

## Description

_A webpage for children that asks them to type in a word.  The word is added to a list of words that are clickable leading to a new page that shows more information on the words.  The children can add definitions to the word and link an image._

## Specs

| Specification                                          | Input                                                | Output                                                                        |
|--------------------------------------------------------|------------------------------------------------------|-------------------------------------------------------------------------------|
| Add word to list                                       | Apple                                                | List: Apple                                                                   |
| Words are clickable links to own page with information | click Apple                                          | Apple Page: defintion: link:                                                  |
| Sort list alphabetically                               | List: Car, Apple                                     | List: Apple, Car                                                              |
| See all words and definitions                          | List: Car, Apple                                     | Car: definition: link: Apple: definition: link:                               |
| each word has its own page with specific information   | Pizza                                                | Pizza Page: definition: link:                                                 |
| add definition to word                                 | Pizza Page: definition: link:                        | Pizza Page: definition: delicious Italian dish                                |
| add link to word                                       | Pizza Page: definition: delicious Italian dish link: | Pizza Page:definition: delicious Italian dish link: "www.pizza.com/pizza.jpg" |
| delete word                                            | List: Car, Apple, Pizza                              | List: Car, Pizza                                                              |
| Randomly visit a word page                             | List: Car, Apple, Pizza                              | Pizza Page: definition: link:                                                 |
## Setup

* _._


## Known Bugs

_None_

## Support and contact details

_If you have any technical issues please contact me at_
_heltmm@gmail.com_

## Technologies Used

_Ruby_
_Sinatra_

### License

*This software is licensed under the MIT license.*

Copyright (c) 2016 **_Mark Helt_**
