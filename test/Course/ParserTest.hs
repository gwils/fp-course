{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Course.ParserTest where

import           Test.Tasty            (TestTree, testGroup)
import           Test.Tasty.HUnit      (testCase, (@?=))
import           Test.Tasty.QuickCheck (testProperty)

import           Course.Core
import           Course.Parser
import           Data.Char             (isUpper)

test_Parser :: TestTree
test_Parser =
  testGroup "Parser" [
    valueParserTest
  , failedTest
  , characterTest
  , mapParserTest
  , bindParserTest
  , greaterGreaterGreaterTest
  , alternateTest
  , listTest
  , list1Test
  , satisfyTest
  , isTest
  , digitTest
  , naturalTest
  , sequenceParserTest
  , thisManyParserTest
  , ageParserTest
  , firstNameParserTest
  , surnameParserTest
  , smokerParserTest
  , phoneBodyParserTest
  , phoneParserTest
  , personParserTest
  ]

valueParserTest :: TestTree
valueParserTest =
  testCase "valueParser" $ parse (valueParser 3) "abc" @?= Result "abc" 3

failedTest :: TestTree
failedTest =
  testCase "failedTest" $ isErrorResult (parse failed "abc") @?= True

characterTest :: TestTree
characterTest =
  testGroup "character" [
    testCase "succeed" $ parse character "abc" @?= Result "bc" 'a'
  , testCase "fail" $ isErrorResult (parse character "") @?= True
  ]

mapParserTest :: TestTree
mapParserTest =
  testGroup "mapParser" [
    testCase "character" $ parse (mapParser succ character) "amz" @?= Result "mz" 'b'
  , testCase "value" $ parse (mapParser (+10) (valueParser 7)) "" @?= Result "" 17
  ]

bindParserTest :: TestTree
bindParserTest =
  undefined

greaterGreaterGreaterTest :: TestTree
greaterGreaterGreaterTest =
  undefined

alternateTest :: TestTree
alternateTest =
  undefined

listTest :: TestTree
listTest =
  undefined

list1Test :: TestTree
list1Test =
  undefined

satisfyTest :: TestTree
satisfyTest =
  undefined

isTest :: TestTree
isTest =
  undefined

digitTest :: TestTree
digitTest =
  undefined

naturalTest :: TestTree
naturalTest =
  undefined

sequenceParserTest :: TestTree
sequenceParserTest =
  undefined

thisManyParserTest :: TestTree
thisManyParserTest =
  undefined

ageParserTest :: TestTree
ageParserTest =
  undefined

firstNameParserTest :: TestTree
firstNameParserTest =
  undefined

surnameParserTest :: TestTree
surnameParserTest =
  undefined

smokerParserTest :: TestTree
smokerParserTest =
  undefined

phoneBodyParserTest :: TestTree
phoneBodyParserTest =
  undefined

phoneParserTest :: TestTree
phoneParserTest =
  undefined

personParserTest :: TestTree
personParserTest =
  undefined
