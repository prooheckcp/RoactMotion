"use strict";(self.webpackChunkwebsite_template=self.webpackChunkwebsite_template||[]).push([[76],{3905:function(n,e,t){t.d(e,{Zo:function(){return m},kt:function(){return p}});var o=t(7294);function i(n,e,t){return e in n?Object.defineProperty(n,e,{value:t,enumerable:!0,configurable:!0,writable:!0}):n[e]=t,n}function a(n,e){var t=Object.keys(n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(n);e&&(o=o.filter((function(e){return Object.getOwnPropertyDescriptor(n,e).enumerable}))),t.push.apply(t,o)}return t}function r(n){for(var e=1;e<arguments.length;e++){var t=null!=arguments[e]?arguments[e]:{};e%2?a(Object(t),!0).forEach((function(e){i(n,e,t[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(n,Object.getOwnPropertyDescriptors(t)):a(Object(t)).forEach((function(e){Object.defineProperty(n,e,Object.getOwnPropertyDescriptor(t,e))}))}return n}function c(n,e){if(null==n)return{};var t,o,i=function(n,e){if(null==n)return{};var t,o,i={},a=Object.keys(n);for(o=0;o<a.length;o++)t=a[o],e.indexOf(t)>=0||(i[t]=n[t]);return i}(n,e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(n);for(o=0;o<a.length;o++)t=a[o],e.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(n,t)&&(i[t]=n[t])}return i}var l=o.createContext({}),s=function(n){var e=o.useContext(l),t=e;return n&&(t="function"==typeof n?n(e):r(r({},e),n)),t},m=function(n){var e=s(n.components);return o.createElement(l.Provider,{value:e},n.children)},u={inlineCode:"code",wrapper:function(n){var e=n.children;return o.createElement(o.Fragment,{},e)}},d=o.forwardRef((function(n,e){var t=n.components,i=n.mdxType,a=n.originalType,l=n.parentName,m=c(n,["components","mdxType","originalType","parentName"]),d=s(t),p=i,f=d["".concat(l,".").concat(p)]||d[p]||u[p]||a;return t?o.createElement(f,r(r({ref:e},m),{},{components:t})):o.createElement(f,r({ref:e},m))}));function p(n,e){var t=arguments,i=e&&e.mdxType;if("string"==typeof n||i){var a=t.length,r=new Array(a);r[0]=d;var c={};for(var l in e)hasOwnProperty.call(e,l)&&(c[l]=e[l]);c.originalType=n,c.mdxType="string"==typeof n?n:i,r[1]=c;for(var s=2;s<a;s++)r[s]=t[s];return o.createElement.apply(null,r)}return o.createElement.apply(null,t)}d.displayName="MDXCreateElement"},9548:function(n,e,t){t.r(e),t.d(e,{assets:function(){return m},contentTitle:function(){return l},default:function(){return p},frontMatter:function(){return c},metadata:function(){return s},toc:function(){return u}});var o=t(7462),i=t(3366),a=(t(7294),t(3905)),r=["components"],c={displayed_sidebar:"docsSidebar",sidebar_position:4,title:"Chained Animations"},l=void 0,s={unversionedId:"docs/Guide/ChainedAnimations",id:"docs/Guide/ChainedAnimations",title:"Chained Animations",description:"Wow we've already been thru a lot together! But now you're probably thinking, what about chained animations? How would I approach this?",source:"@site/docs/docs/Guide/ChainedAnimations.md",sourceDirName:"docs/Guide",slug:"/docs/Guide/ChainedAnimations",permalink:"/RoactMotion/docs/docs/Guide/ChainedAnimations",draft:!1,tags:[],version:"current",sidebarPosition:4,frontMatter:{displayed_sidebar:"docsSidebar",sidebar_position:4,title:"Chained Animations"},sidebar:"docsSidebar",previous:{title:"Animations",permalink:"/RoactMotion/docs/docs/Guide/Animations"},next:{title:"Controllers",permalink:"/RoactMotion/docs/docs/Guide/Controllers"}},m={},u=[],d={toc:u};function p(n){var e=n.components,t=(0,i.Z)(n,r);return(0,a.kt)("wrapper",(0,o.Z)({},d,t,{components:e,mdxType:"MDXLayout"}),(0,a.kt)("p",null,"Wow we've already been thru a lot together! But now you're probably thinking, what about chained animations? How would I approach this?"),(0,a.kt)("p",null,"Don't worry, RoactMotion has a million way of doing whatever you wish with it! Making chained animations is as simple as quite literally passing an array instead of a target value. Remember the last example with the cube? Let's make that animation a bit more complex now!"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},"local transition : RoactMotion.Transition = RoactMotion.Transition.new()\ntransition.duration = 0.5\n\nlocal animation : RoactMotion.Animation = RoactMotion.Animation.new({\n    Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}\n}, transition)\n")),(0,a.kt)("p",null,"This should make the cube move around the screen, let's watch it in action."),(0,a.kt)("img",{src:"https://cdn.discordapp.com/attachments/670023265455964198/1049449218508607508/CubeMoving.gif",alt:"drawing",width:"800"}),(0,a.kt)("p",null,"You can do this for multiple values at the same time and for as many keypoints as you wish! The only limit is your imagination."),(0,a.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,a.kt)("div",{parentName:"div",className:"admonition-heading"},(0,a.kt)("h5",{parentName:"div"},(0,a.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,a.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,a.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"info")),(0,a.kt)("div",{parentName:"div",className:"admonition-content"},(0,a.kt)("p",{parentName:"div"},"Since we specified that the duration of the transition = 0.5 it will make this animation take 2 seconds to finish. Each keypoint should take 0.5 seconds and since we created 4 of them it will take 0.5 x 4 to finish."))),(0,a.kt)("p",null,"But this is not the only way to chain things! We can also give it a callback for when it finishes the same way you'd give a promise!"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},'local animation : Roact.Animation = RoactMotion.Animation.new({\n    Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}\n}, transition):andThen(function()\n    print("Hi mom!")\nend)\n')),(0,a.kt)("p",null,'In this case we printed "Hi mom!" but instead we can also just call another animation object to make an even more complex animation! The limit is your imagination!'),(0,a.kt)("p",null,"In case you got lost this is the full code so far:"),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-luau"},'local Players = game:GetService("Players")\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\n\nlocal Roact = require(ReplicatedStorage.Packages.roact) --Use whatever path you have for your Roact\nlocal RoactMotion = require(ReplicatedStorage.RoactMotion)(Roact) --Replace ReplicatedStorage.RoactMotion with whatever path you need\n\nlocal transition : RoactMotion.Transition = RoactMotion.Transition.new()\ntransition.duration = 0.5\n\nlocal animation : RoactMotion.Animation = RoactMotion.Animation.new({\n    Position = {UDim2.fromScale(0.2 ,0.2), UDim2.fromScale(0.2, 0.8), UDim2.fromScale(0.8, 0.8), UDim2.fromScale(0.8, 0.2)}\n}, transition):andThen(function()\n    print("Hi mom!")\nend)\n\nRoact.mount(Roact.createElement("ScreenGui", {}, {\n    RoactMotion.createElement("TextButton", {\n        AnchorPoint = Vector2.new(0.5, 0.5),\n        Position = UDim2.fromScale(0.5, 0.5),\n        Size = UDim2.fromOffset(100, 50),\n        Text = "Hello world!",\n        BackgroundTransparency = 0,\n    }, \n    nil, {\n        [RoactMotion.Event.whileHover] = {\n            Size = UDim2.fromOffset(150, 80)\n        },\n        \n        [RoactMotion.Event.whileTap] = {\n            Size = UDim2.fromOffset(80, 40)\n        },\n        \n        [RoactMotion.Event.onTap] = function()\n            animation:play()\n        end,\n        transition = transition\n    }),\n    RoactMotion.createElement("Frame", {\n        Size = UDim2.fromOffset(50, 50),\n        AnchorPoint = Vector2.new(0.5, 0.5),\n        Position = UDim2.fromScale(0.5, 0.2),\n    }, nil, {\n        animate = {animation}\n    })\n}), Players.LocalPlayer.PlayerGui, "TestGUI")\n')))}p.isMDXComponent=!0}}]);