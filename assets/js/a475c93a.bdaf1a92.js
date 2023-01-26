"use strict";(self.webpackChunkwebsite_template=self.webpackChunkwebsite_template||[]).push([[280],{3905:function(e,t,n){n.d(t,{Zo:function(){return u},kt:function(){return p}});var o=n(7294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);t&&(o=o.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,o)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,o,r=function(e,t){if(null==e)return{};var n,o,r={},a=Object.keys(e);for(o=0;o<a.length;o++)n=a[o],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(o=0;o<a.length;o++)n=a[o],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var c=o.createContext({}),s=function(e){var t=o.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},u=function(e){var t=s(e.components);return o.createElement(c.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return o.createElement(o.Fragment,{},t)}},d=o.forwardRef((function(e,t){var n=e.components,r=e.mdxType,a=e.originalType,c=e.parentName,u=l(e,["components","mdxType","originalType","parentName"]),d=s(n),p=r,f=d["".concat(c,".").concat(p)]||d[p]||m[p]||a;return n?o.createElement(f,i(i({ref:t},u),{},{components:n})):o.createElement(f,i({ref:t},u))}));function p(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var a=n.length,i=new Array(a);i[0]=d;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l.mdxType="string"==typeof e?e:r,i[1]=l;for(var s=2;s<a;s++)i[s]=n[s];return o.createElement.apply(null,i)}return o.createElement.apply(null,n)}d.displayName="MDXCreateElement"},5003:function(e,t,n){n.r(t),n.d(t,{assets:function(){return u},contentTitle:function(){return c},default:function(){return p},frontMatter:function(){return l},metadata:function(){return s},toc:function(){return m}});var o=n(7462),r=n(3366),a=(n(7294),n(3905)),i=["components"],l={displayed_sidebar:"docsSidebar",sidebar_position:5,title:"Controllers"},c=void 0,s={unversionedId:"docs/Guide/Controllers",id:"docs/Guide/Controllers",title:"Controllers",description:"We're almost done with the basics... There's only 1 more thing that you should be aware of! And that one thing is controllers. The same way we created transitions and animations you can also create 1 controller to manage animations at run-time. Let's start by creating a controller!",source:"@site/docs/docs/Guide/Controllers.md",sourceDirName:"docs/Guide",slug:"/docs/Guide/Controllers",permalink:"/RoactMotion/docs/docs/Guide/Controllers",draft:!1,tags:[],version:"current",sidebarPosition:5,frontMatter:{displayed_sidebar:"docsSidebar",sidebar_position:5,title:"Controllers"},sidebar:"docsSidebar",previous:{title:"Chained Animations",permalink:"/RoactMotion/docs/docs/Guide/ChainedAnimations"}},u={},m=[],d={toc:m};function p(e){var t=e.components,n=(0,r.Z)(e,i);return(0,a.kt)("wrapper",(0,o.Z)({},d,n,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("p",null,"We're almost done with the basics... There's only 1 more thing that you should be aware of! And that one thing is controllers. The same way we created transitions and animations you can also create 1 controller to manage animations at run-time. Let's start by creating a controller!"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},"local controller : RoactMotion.Controller = RoactMotion.Controller.new()\n")),(0,a.kt)("p",null,"Remember how we fed the previous elements into our RoactMotion element? Well it's basically the same way!"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},'    RoactMotion.createElement("Frame", {\n        Size = UDim2.fromOffset(50, 50),\n        AnchorPoint = Vector2.new(0.5, 0.5),\n        Position = UDim2.fromScale(0.5, 0.2),\n    }, nil, {\n        animate = {animation},\n        controller = controller --Give him the controller like this!\n    })\n')),(0,a.kt)("p",null,"For this example we'll make the cube move to a random position in our UI! Here's the example code..."),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},'local controller : RoactMotion.Controller = RoactMotion.Controller.new()\n\nRoact.mount(Roact.createElement("ScreenGui", {}, {\n    RoactMotion.createElement("TextButton", {\n        AnchorPoint = Vector2.new(0.5, 0.5),\n        Position = UDim2.fromScale(0.5, 0.5),\n        Size = UDim2.fromOffset(100, 50),\n        Text = "Hello world!",\n        BackgroundTransparency = 0,\n    }, \n    nil, {\n        [RoactMotion.Event.whileHover] = {\n            Size = UDim2.fromOffset(150, 80)\n        },\n        \n        [RoactMotion.Event.whileTap] = {\n            Size = UDim2.fromOffset(80, 40)\n        },\n        \n        [RoactMotion.Event.onTap] = function()\n            --[[\n                Here we generate some random coordinates and tell the cube to move to this target position\n            ]]\n            local rand = Random.new()\n            local x = rand:NextNumber()\n            local y = rand:NextNumber()\n            controller:play({\n                Position = UDim2.fromScale(x, y)    \n            }, transition)\n        end,\n        transition = transition\n    }),\n    RoactMotion.createElement("Frame", {\n        Size = UDim2.fromOffset(50, 50),\n        AnchorPoint = Vector2.new(0.5, 0.5),\n        Position = UDim2.fromScale(0.5, 0.2),\n    }, nil, {\n        animate = {animation},\n        controller = controller\n    })\n}), Players.LocalPlayer.PlayerGui, "TestGUI")\n')),(0,a.kt)("img",{src:"https://cdn.discordapp.com/attachments/670023265455964198/1049454216567066655/RandomCube.gif",alt:"drawing",width:"800"}),(0,a.kt)("p",null,"The whole purpose of controllers is to let us animate things that require parameters that change at run-time! And that's about it, this is all you need to know to get started with Roact Motion. There's more details but you'll learn them along the way!"))}p.isMDXComponent=!0}}]);