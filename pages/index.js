import Layout from '../components/MyLayout.js'
import Link from 'next/link'
import fetch from 'isomorphic-unfetch'
import '../styles/style.scss'

const Index = (props) => (
    <Layout>
        <h1>Batman TV Shows xxx</h1>
        <style jsx>{`
          li {
            font-size: 14px;
          }
        `}</style>
            <style global jsx>{`
          body {
            background: white;
          }
        `}</style>
        <ul>

            {props.shows.map(({show}) => (
                <li key={show.id}>
                    <Link as={`/p/${show.id}`} href={`/post?id=${show.id}`}>
                        <a>{show.name}</a>
                    </Link>
                </li>
            ))}
        </ul>
        <button>button</button>
        <img width={ 100 } src={require('../static/images/img-about-shirts-01.png')} alt="my image" />
      <div>{ props.hostname }</div>
    </Layout>
)

Index.getInitialProps = async function(context) {
  console.log(context.res.hostname)
    const res1 = await fetch('https://api.tvmaze.com/search/shows?q=batman')
    const data = await res1.json()

    console.log(`Show data fetched. Count: ${data.length}`)

    return {
        shows: data,
        hostname: context.res.hostname ? context.res.hostname : 'test'
    }
}

export default Index