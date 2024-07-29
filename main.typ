#let dividerline() = {
  v(-5pt)
  line(length: 100%, stroke: gray)
  v(-8pt)
}

#let fa(name) = {
  text(
    font: "Font Awesome 6 Free Solid",
    box[ #name ],
  )
}

#let link-icon = symbol("\u{f0c1}")

#let github = symbol("\u{f09b}")
#let blog = symbol("\u{f09e}")
#let email = symbol("\u{f0e0}")
#let phone = symbol("\u{f095}")

#let iconlink(
  uri,
  text: [],
  icon: link-icon,
) = {
  if text == [] {
    text = uri
  }
  link(uri)[#fa[#icon] #text]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa[#github] #userRepo]
}

#let emaillink(emailaddr) = {
  link("mailto:" + emailaddr)[#fa[#email] #emailaddr]
}

#let cventry(
  tl: "",
  tr: "",
  bl: [],
  br: [],
  content,
) = {
  block(
    inset: (left: 0pt),
    if tl != "" or tr != "" {
      tl + h(1fr) + tr + linebreak()
    } + if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } + content,
  )
}

#let cv(body) = {
  set par(justify: true)

  show heading.where(level: 1): set text(
    size: 15pt,
    weight: "light",
  )

  let the-font = (
    "Palatino",
    "Noto Serif CJK SC",
  )

  show heading.where(level: 2): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(dividerline() + it),
  )

  set list(indent: 2pt)
  set text(
    font: the-font,
    size: 10pt,
  )

  show link: it => underline(offset: 2pt, it)
  set page(
    margin: (x: 0.5cm, y: 0.9cm),
    numbering: "1 / 1",
  )
  set par(justify: true)

  body
}

#let newpage = {
  set page(margin: (x: 0.5cm, y: 0.9cm), numbering: "1 / 1")
  set par(justify: true)
}

#let Chinese = 0
#let English = 1
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let months = (
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  )
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year],
  )
  let current = translate(
    zh: [至今],
    en: [Present],
  )

  let edu = {
    translate(en: [== Education], zh: [== 教育经历])
    let psu-date = [#translate-date(9, 2017) -- #translate-date(7, 2021)]
    translate(
      en: cventry(
        tl: [Bachelor's Degree in Electronic Information Science and Technology, *HeFei University of Technology*],
        tr: psu-date,
      )[],
      zh: cventry(
        tl: [合肥工业大学，电子信息科学与技术专业，计算机学院，本科],
        tr: psu-date,
      )[],
    )
  }

  let shopeework = {
    translate(
      en: cventry(
        tl: [*Shopee Inc.*, ShenZheng, China],
        tr: [#translate-date(7, 2021) -- #current],
      )[],
      zh: cventry(
        tl: [深圳虾皮信息科技发展有限公司],
        tr: [#translate-date(7, 2021) -- #current],
      )[],
    )

    let openresty = link("https://openresty.org", "OpenResty")

    translate(
      en: cventry(
        bl: [*Shopee Seller Platform*, Backend Development],
        br: [#translate-date(7, 2021) -- #translate-date(12, 2022)],
      )[
        - Seller platform is responsible for the direction of public capacity, account, login, etc., including API gateway, seller master station, unified login, master-sub-account system, and function switch project.
        - Mainly responsible for the development of the seller's main station and function switch project, design and implement several unified framework modules, such as exchange rate, pop-up window, audit system, export center, marking, etc. Design and implement the announcement, sidebar, shop settings, etc. of the main station.
        - Design and realize homepage modules such as main site announcement, sidebar, store settings, etc. Maintain services such as questionnaire system and management platform.
        - Participate in the development of seller department #openresty gateway, design and maintain plug-in system.
      ],
      zh: cventry(
        bl: [Shopee 卖家平台, Backend Development],
        br: [#translate-date(7, 2021) -- #translate-date(12, 2022)],
      )[
        - 业务介绍：卖家平台负责站点首页、公共能力、主子账号、统一登录、API 网关等方向，为本地和跨境店铺提供商家端站点，为运营提供高效运营工具。
        - 负责设计并实现汇率、公告、弹窗、审核系统、侧边栏等模块，维护问卷系统、功能开关和运营平台等服务。
        - 参与开发卖家部门 #openresty 网关，设计并维护内部插件。
      ],
    )

    translate(
      en: cventry(
        bl: [*Shopee Open Platform*, Backend Development],
        br: [#translate-date(12, 2022) -- #current],
      )[
        - The open platform provides OpenAPI authentication and authorization, message push, console and other functions, providing comprehensive merchant management capabilities for millions of Shopee stores.
        - Mainly responsible for the development of gateway, console, push system and other services to enrich the console functions, improve the performance of authentication and authorization, enhance the observability of the system and improve user experience.
        - Participate in region splitting program (off-site multi-live) and disaster recovery program (same city multi-live) to improve system stability.
        - Participate in horizontal project development, such as refactoring, cost reduction and efficiency, service governance, region splitting, disaster recovery, etc.],
      zh: cventry(
        bl: [Shopee 开放平台（同组不同业务）, Backend Development],
        br: [#translate-date(12, 2022) -- #current],
      )[
        - 业务介绍：开放平台提供 OpenAPI 鉴权授权、消息推送、沙箱环境和门户站点等业务，为开发者提供全面的商家管理能力。
        - 主要负责网关插件、开发者控制台和推送系统等服务，提高鉴权授权性能，丰富控制台功能，提升系统可观测性和提高用户体验。
        - 参与横向项目开发，如地区拆分、异地灾备、重构、降本增效和服务治理等。
      ],
    )
  }

  let gateway = {
    cventry(
      tl: [API Gateway],
    )[]

    translate(
      en: [
        - Based on OpenResty, developed in Lua, including HTTP/RPC/HTTP-Over-RPC, traffic control, gray rules, authentication, etc.
        - Based on plugin system, developed and maintained multiple plugins, including OpenAPI report plugin for calling statistics（60k+QPS），data sent to Kafka for other systems to provide data support.
      ],
      zh: [
        - 基于 OpenResty 实现，使用 Lua 语言开发，包括请求转发（HTTP/RPC/HTTP-Over-RPC）、流量控制、灰度规则和认证鉴权等功能。
        - 基于插件系统开发并维护多个插件，其中 OpenAPI 上报插件用于上报开发者调用记录（60k+QPS），实现解析规则用于打码上报数据。数据经由 Kafka 传输到 ES/Hive/Clickhouse，为其他系统提供数据支持。
      ],
    )
  }

  let openservice = {
    cventry(
      tl: [Open Service],
      tr: link("https://open.shopee.com/"),
    )[]

    translate(
      en: [
        - Based on region split, optimize push system delay, and reduce push system delay.
        - Add multiple console panels, including call statistics, business analysis, log search.
      ],
      zh: [
        - 优化系统性能和稳定性，包括优化鉴权流程、页面延迟优化、增加降级策略等，保障系统稳定性和提升开发者体验。
        - 基于地区拆分方案优化推送系统，有效降低异地推送耗时（600ms->30ms），提供控制台测速功能，帮助开发者选择最佳推送服务器。
        - 为用户控制台添加多个模块，如统计看板、商业分析页、日志搜索、漏洞看板、惩罚系统等，丰富平台功能提升用户体验。
      ],
    )
  }


  let sellermisc = {
    cventry(
      tl: [Seller Service],
      tr: link("https://seller.shopee.co.id/"),
    )[]

    translate(
      en: [
        - Includes unified popups, sidebars, etc. With asynchronous loading, cache and message queue, it greatly improved the response speed and seller experience.
        - Function switch project used for flexible configuration of feature blacklist, with tagging, version management and rollback, it is widely used in the department.
      ],
      zh: [
        - 主站服务包含统一弹窗、侧边栏等模块，内部广泛采用了异步加载、缓存和消息队列等技术，显著提升了网站响应速度和卖家体验。
        - 功能开关项目用于灵活配置功能黑白名单，具有打标、版本管理和回滚等功能，广泛应用于卖家各项业务。
      ],
    )
  }

  let partnervoucher = {
    cventry(
      tl: [Partner Voucher],
      tr: link("https://partnervoucher.shopee.co.id/"),
    )[]

    translate(
      en: [
        - Online voucher code management service, including organization management, balance, order and approval flow.
        - Independently complete backend design and development, and work with multiple teams to achieve project development and management.
      ],
      zh: [
        - 企业优惠券购买管理平台，提供组织管理、余额、订单和审批流等功能，创造数百万美元的收益。
        - 独立完成平台后端设计与开发，负责跨团队推进项目开发部分，及时管理进度。
      ],
    )
  }

  let gnar = {
    cventry(
      tl: [Gnar],
      tr: githublink("abcdlsj/gnar"),
    )[]

    translate(
      en: [
        - Intranet port forwarding tool, similar to Frp/Ngork
        - Forwarding protocol support TCP/UDP,using Yamux support multiplexing
      ],
      zh: [
        - 内网端口转发工具，类似于 Frp/Ngork，转发协议支持 TCP/UDP，使用 Yamux 支持连接多路复用。
      ],
    )
  }

  let cLsm = {
    cventry(
      tl: [cLSM],
      tr: githublink("abcdlsj/clsm"),
    )[]

    translate(
      en: [
        - A LSM-Tree data structure implementation based on SkipList
      ],
      zh: [
        - 基于 SkipList 的 LSM-Tree 数据结构实现（BloomFilter、SkipList）。
      ],
    )
  }

  let skills = {

    let progLang = {
      translate(
        en: [
          - Programming language: Very familiar with Go, familiar with Python, Lua, C++, Rust.
        ],
        zh: [
          - 编程语言：熟悉 Go，了解 Python、Lua、C++、Rust，熟悉算法与数据结构。
        ],
      )
    }
    let systemNetwork = {
      translate(
        en: [- System and network: Familiar with operating system and network protocols.],
        zh: [- 操作系统 \& 网络：熟悉操作系统，包括进程、内存、Linux、多路复用、容器化技术。熟悉常见网络协议。],
      )
    }
    let middles = {
      translate(
        en: [
          - Middle: Good at using daily tools and scripts, with experience in Jira, Gitlab, Confluence.
        ],
        zh: [
          - 中间件：熟悉 MySQL、Redis、Kafka 的使用和原理，有 Elasticsearch、Clickhouse、RabbitMQ 使用经验。
        ],
      )
    }
    let devTools = {
      translate(
        en: [- Development tools: Good at using daily tools and scripts, with experience in Jira, Gitlab, Confluence.],
        zh: [- 开发工具：善于使用日常工具和脚本，熟悉 Jira、Gitlab、Confluence 等团队协作工具。],
      )
    }

    let commus = {
      translate(
        en: [
          - Communication: Have strong communication skills and experience with cross-department communication and project management.
        ],
        zh: [
          - 沟通\&协作：具有独立设计和实施解决方案的能力，善于跨部门协作与沟通，有效管理项目进度并确保按时交付。
        ]
      )
    }
    progLang
    systemNetwork
    middles
    devTools
    commus
  }

  let misc = {
    translate(
      en: [
        - I am very interested in sharing and recording
      ],
      zh: [
        - 喜欢折腾和探索不同领域的技术，热爱分享和记录。
      ],
    )
  }

  translate(en: [= #smallcaps[Songjian Li]], zh: [= 李松健])

  [#emaillink("career@songjian.li") $dot.c$ #iconlink(
      "+86 17356375549",
      icon: phone,
    ) $dot.c$ #iconlink(
      "https://abcdlsj.github.io",
      icon: blog,
    ) $dot.c$ #iconlink(
      "https://github.com/abcdlsj",
      icon: github,
    )]
  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  shopeework

  translate(en: [== Related Projects], zh: [== 项目经历])
  openservice
  gateway
  sellermisc
  partnervoucher

  translate(en: [== Personal Projects], zh: [== 个人项目])
  gnar
  cLsm

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}
