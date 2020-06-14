let CO =
      { Target =
          < es3
          | es5
          | es6
          | es2015
          | es2016
          | es2017
          | es2018
          | es2019
          | es2020
          | esnext
          >
      , JSX = < preserve | react | react-native >
      , Module =
          < commonJS
          | amd
          | umd
          | system
          | es6
          | es2015
          | es2020
          | esnext
          | none
          >
      , Lib =
          < es5
          | es6
          | es7
          | es2015
          | es2016
          | es2017
          | es2018
          | es2019
          | es2020
          | esnext
          | dom
          | scripthost
          | webworker
          >
      }

let JSConfigType =
      { compilerOptions :
          { target : CO.Target
          , jsx : CO.JSX
          , module : CO.Module
          , baseUrl : Text
          , allowSyntheticDefaultImports : Bool
          , noEmit : Bool
          , lib : List CO.Lib
          , rootDirs : List Text
          }
      , exclude : List Text
      }

let JSConfig =
      { Type = JSConfigType
      , default =
          { compilerOptions =
              { target = CO.Target.es6
              , jsx = CO.JSX.preserve
              , module = CO.Module.es6
              , baseUrl = "src"
              , allowSyntheticDefaultImports = False
              , noEmit = True
              , rootDirs = [ "src" ]
              , lib = [ CO.Lib.dom ]
              }
          , exclude = [ "node_modules" ]
          }
      }

in  JSConfig::{
    , compilerOptions = JSConfig.default.compilerOptions::{
      , rootDirs = [ "src" ]
      }
    }
