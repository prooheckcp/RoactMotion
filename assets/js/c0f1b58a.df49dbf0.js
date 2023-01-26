"use strict";(self.webpackChunkwebsite_template=self.webpackChunkwebsite_template||[]).push([[979],{3905:function(t,e,n){n.d(e,{Zo:function(){return p},kt:function(){return d}});var a=n(7294);function r(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}function o(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(t);e&&(a=a.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),n.push.apply(n,a)}return n}function i(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?o(Object(n),!0).forEach((function(e){r(t,e,n[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))}))}return t}function l(t,e){if(null==t)return{};var n,a,r=function(t,e){if(null==t)return{};var n,a,r={},o=Object.keys(t);for(a=0;a<o.length;a++)n=o[a],e.indexOf(n)>=0||(r[n]=t[n]);return r}(t,e);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(t);for(a=0;a<o.length;a++)n=o[a],e.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(t,n)&&(r[n]=t[n])}return r}var s=a.createContext({}),c=function(t){var e=a.useContext(s),n=e;return t&&(n="function"==typeof t?t(e):i(i({},e),t)),n},p=function(t){var e=c(t.components);return a.createElement(s.Provider,{value:e},t.children)},u={inlineCode:"code",wrapper:function(t){var e=t.children;return a.createElement(a.Fragment,{},e)}},m=a.forwardRef((function(t,e){var n=t.components,r=t.mdxType,o=t.originalType,s=t.parentName,p=l(t,["components","mdxType","originalType","parentName"]),m=c(n),d=r,f=m["".concat(s,".").concat(d)]||m[d]||u[d]||o;return n?a.createElement(f,i(i({ref:e},p),{},{components:n})):a.createElement(f,i({ref:e},p))}));function d(t,e){var n=arguments,r=e&&e.mdxType;if("string"==typeof t||r){var o=n.length,i=new Array(o);i[0]=m;var l={};for(var s in e)hasOwnProperty.call(e,s)&&(l[s]=e[s]);l.originalType=t,l.mdxType="string"==typeof t?t:r,i[1]=l;for(var c=2;c<o;c++)i[c]=n[c];return a.createElement.apply(null,i)}return a.createElement.apply(null,n)}m.displayName="MDXCreateElement"},5520:function(t,e,n){n.r(e),n.d(e,{assets:function(){return p},contentTitle:function(){return s},default:function(){return d},frontMatter:function(){return l},metadata:function(){return c},toc:function(){return u}});var a=n(7462),r=n(3366),o=(n(7294),n(3905)),i=["components"],l={displayed_sidebar:"apiSidebar",sidebar_position:2,title:"Controller\u2b50"},s=void 0,c={unversionedId:"api/Classes/Controller",id:"api/Classes/Controller",title:"Controller\u2b50",description:"Summary",source:"@site/docs/api/Classes/Controller.md",sourceDirName:"api/Classes",slug:"/api/Classes/Controller",permalink:"/RoactMotion/docs/api/Classes/Controller",draft:!1,tags:[],version:"current",sidebarPosition:2,frontMatter:{displayed_sidebar:"apiSidebar",sidebar_position:2,title:"Controller\u2b50"},sidebar:"apiSidebar",previous:{title:"Animation\u2b50",permalink:"/RoactMotion/docs/api/Classes/Animation"},next:{title:"Transition\u2b50",permalink:"/RoactMotion/docs/api/Classes/Transition"}},p={},u=[{value:"Summary",id:"summary",level:2},{value:"Constructors",id:"constructors",level:2},{value:"Methods",id:"methods",level:2},{value:"play",id:"play",level:3},{value:"Parameters",id:"parameters",level:4},{value:"Returns",id:"returns",level:4}],m={toc:u};function d(t){var e=t.components,n=(0,r.Z)(t,i);return(0,o.kt)("wrapper",(0,a.Z)({},m,n,{components:e,mdxType:"MDXLayout"}),(0,o.kt)("h2",{id:"summary"},"Summary"),(0,o.kt)("p",null,"The ",(0,o.kt)("a",{parentName:"p",href:"Controller"},(0,o.kt)("inlineCode",{parentName:"a"},"Controller"))," is a class that allows you to play animations at run-time. It's specially useful if you want to run an animation with custom values that cannot be predicted."),(0,o.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"You must declare the variables that will be tweened within the default properties of the element or else it won't work due to a Roact limitation. If you plan to per example dynamically change the BackgroundColor3 in the future you should declare it at the start."),(0,o.kt)("pre",{parentName:"div"},(0,o.kt)("code",{parentName:"pre",className:"language-luau"},'RoactMotion.createElement("Frame", {\n    BackgroundColor3 = Color3.fromRgb(255, 255, 255)\n})\n')))),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-luau"},'local controller : RoactMotion.Controller = RoactMotion.Controller.new()\n\nRoactMotion.createElement("TextButton", {\n    Position = UDim2.fromScale(0.5, 0.5),\n}, nil {\n    [RoactMotion.Event.onTap] = function()\n        --[[\n            Here we generate some random coordinates and tell the cube to move to this target position\n        ]]\n        local rand = Random.new()\n        local x = rand:NextNumber()\n        local y = rand:NextNumber()\n        controller:play({\n            Position = UDim2.fromScale(x, y)    \n        }, transition)\n    end,\n    controller = controller\n}}\n')),(0,o.kt)("h2",{id:"constructors"},"Constructors"),(0,o.kt)("table",null,(0,o.kt)("thead",{parentName:"table"},(0,o.kt)("tr",{parentName:"thead"},(0,o.kt)("th",{parentName:"tr",align:"left"},"new(animationObject : ",(0,o.kt)("inlineCode",{parentName:"th"},"{}"),", transition : ",(0,o.kt)("inlineCode",{parentName:"th"},"RoactMotion.Transition?"),")"))),(0,o.kt)("tbody",{parentName:"table"},(0,o.kt)("tr",{parentName:"tbody"},(0,o.kt)("td",{parentName:"tr",align:"left"},"Returns a new ",(0,o.kt)("a",{parentName:"td",href:"Controller"},(0,o.kt)("inlineCode",{parentName:"a"},"RoactMotion.Controller")))))),(0,o.kt)("h2",{id:"methods"},"Methods"),(0,o.kt)("h3",{id:"play"},"play"),(0,o.kt)("p",null,"Plays the animation you wish with the given transition."),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-luau"},'local controller : RoactMotion.Controller = RoactMotion.Controller.new()\n\nRoactMotion.createElement("TextButton", {\n    Position = UDim2.fromScale(0.5, 0.5),\n}, nil {\n    [RoactMotion.Event.onTap] = function()\n        controller:play({\n            Position = UDim2.fromScale(0.2, 0.2)    \n        }, transition)\n    end,\n    controller = controller\n}}\n')),(0,o.kt)("h4",{id:"parameters"},"Parameters"),(0,o.kt)("table",null,(0,o.kt)("thead",{parentName:"table"},(0,o.kt)("tr",{parentName:"thead"},(0,o.kt)("th",{parentName:"tr",align:null},"animation : ",(0,o.kt)("inlineCode",{parentName:"th"},"animation")),(0,o.kt)("th",{parentName:"tr",align:null},"The animation object with the target values"))),(0,o.kt)("tbody",{parentName:"table"},(0,o.kt)("tr",{parentName:"tbody"},(0,o.kt)("td",{parentName:"tr",align:null},"transition : ",(0,o.kt)("a",{parentName:"td",href:"Transition"},(0,o.kt)("inlineCode",{parentName:"a"},"RoactMotion.Transition?"))),(0,o.kt)("td",{parentName:"tr",align:null},"The transition which will be used for this specific animation")))),(0,o.kt)("h4",{id:"returns"},"Returns"),(0,o.kt)("table",null,(0,o.kt)("thead",{parentName:"table"},(0,o.kt)("tr",{parentName:"thead"},(0,o.kt)("th",{parentName:"tr",align:null},(0,o.kt)("inlineCode",{parentName:"th"},"void"))))))}d.isMDXComponent=!0}}]);